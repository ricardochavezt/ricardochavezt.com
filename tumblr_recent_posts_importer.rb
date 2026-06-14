require 'jekyll-import'
require 'open-uri'
require 'uri'
require 'nokogiri'
require 'reverse_markdown'
require 'fileutils'
require 'optparse'

IMPORT_DIR = "_posts"
LAST_IMPORTED_TIMESTAMP_FILE = ".jekyll-cache/tumblr_last_imported"

def extract_json(contents)
    beginning = contents.index("{")
    ending    = contents.rindex("}") + 1
    json_data = contents[beginning...ending] # Strip Tumblr's JSONP chars.
    JSON.parse(json_data)
end

def html_to_markdown(content)
    preserve = %w(table tr th td iframe)
    preserve.each do |tag|
        content.gsub!(%r!<#{tag}!i, "$$#{tag}")
        content.gsub!(%r!</#{tag}!i, "||#{tag}")
    end

    content = ReverseMarkdown.convert(content)

    preserve.each do |tag|
        content.gsub!("$$#{tag}", "<#{tag}")
        content.gsub!("||#{tag}", "</#{tag}")
    end
    content
end

def write_post(post, use_markdown)
    content = post[:content]
    return unless content

    if use_markdown
        content = html_to_markdown content
    end

    File.open("#{IMPORT_DIR}/#{post[:name]}", "w") do |f|
        f.puts post[:header].to_yaml + "---\n" + content
    end
end

FileUtils.mkdir_p IMPORT_DIR
num_posts = 0
OptionParser.new do |parser|
    parser.on("-n", "--number [NUMBER]", Integer, "Number of posts requested") do |num|
        num_posts = num
    end
end.parse!

last_imported_timestamp = Time.local(2020)
if File.exist?(LAST_IMPORTED_TIMESTAMP_FILE)
    File.open(LAST_IMPORTED_TIMESTAMP_FILE) do |f|
        last_imported_timestamp = Time.iso8601(f.read) # TODO catch possible parse error
    end
    puts "Last imported on: #{last_imported_timestamp}"
else
    puts "Last imported timestamp not found, defaulting to #{last_imported_timestamp}"
end

if num_posts > 0
    feed_uri = "https://ricardochavezt.tumblr.com/api/read/json/?num=#{num_posts}"
else
    feed_uri = "https://ricardochavezt.tumblr.com/api/read/json/"
end
feed = URI.parse(feed_uri).open
contents = feed.readlines.join("\n")
blog = extract_json(contents)
blog["posts"].each do |post|
    post_hash = JekyllImport::Importers::Tumblr.post_to_hash(post, "md")
    if Time.iso8601(post_hash[:header]["date"]) > last_imported_timestamp
        if post["reblogged-from-url"]
            post_hash[:header]["repost_of"] = {"name" => "#{post['reblogged-from-name']}.tumblr.com", "url" => post["reblogged-from-url"]}
            post_hash[:header]["category"] = "reposts"
        end
        # TODO post type / category
        write_post(post_hash, true)
    end
end

File.open(LAST_IMPORTED_TIMESTAMP_FILE, "w") do |f|
    f.puts Time.now.iso8601
end

# puts blog["posts"][0]["type"]
# puts post_hash
