require 'jekyll-import'
require 'open-uri'
require 'uri'
require 'nokogiri'
require 'reverse_markdown'
require 'fileutils'
require 'optparse'

FileUtils.mkdir_p "_posts/tumblr"
num_posts = 1
OptionParser.new do |parser|
    parser.on("-n", "--number [NUMBER]", Integer, "Number of posts requested") do |num|
        num_posts = num
    end
end.parse!

feed = URI.parse("https://ricardochavezt.tumblr.com/api/read/json/?num=#{num_posts}").open
contents = feed.readlines.join("\n")
blog = JekyllImport::Importers::Tumblr.extract_json(contents)
blog["posts"].each do |post|
    post_hash = JekyllImport::Importers::Tumblr.post_to_hash(post, "md")
    if post["reblogged-from-url"]
        post_hash[:header]["repost_of"] = {"name" => "#{post['reblogged-from-name']}.tumblr.com", "url" => post["reblogged-from-url"]}
        post_hash[:header]["category"] = "reposts"
    end
    # TODO post type / category
    JekyllImport::Importers::Tumblr.write_post(post_hash, true, false)
end

# puts blog["posts"][0]["type"]
# puts post_hash
