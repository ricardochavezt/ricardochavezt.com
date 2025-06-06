---
layout: page
title: Software projects
permalink: /projects-software
---

## Software projects

These are some of my favorite software projects built by myself as personal / hobby projects (because the <a href="/professional-experience" class="internal-link">professional projects</a>, as you might guess, all live in private repositories owned by the corresponding companies). All of them live on [my Github profile](https://github.com/ricardochavezt), along with some others; it's just that here I can write a description that is longer that the "About" box on Github but shorter than a README, and I can pick more than the limit of 6 pinned repositories.

### This website 🌐

Of course, this here website is a software project itself. Initially thought as a portfolio website (in the hopes that it would help me land a job) and as a place to collect all my other projects that were not related to software, I am now trying to evolve it into my digital garden, a place where I can keep collecting the interesting things I find across the Internet, as well as a way to participate in the [IndieWeb](https://indieweb.org/Main_Page) movement (and thus keep ownership of my content).

Since I want to lean into the digital garden aspect of it, I picked as a starting point [this template](https://github.com/maximevaillancourt/digital-garden-jekyll-template) for the [Jekyll](https://jekyllrb.com/) static site generator, the very same that powers Github Pages. It'll be my very first time using it, so let's see how it goes, but if there's one thing I've learned in the years I've been playing around with code is that the most important thing is the content: as long as it is in an easily readable and transportable format, you can choose whatever works best for your circumstances, and if those circumstances change, you can change the surrounding technology to adapt. (And few formats can beat plain text in the "easily readable and transportable" camp.)

The <abbr title="minimum viable product">MVP</abbr> for the digital garden part will be just an embed of a Notion collection where I keep my interesting reads and my Tumblr (where I keep the rest of interesting things), but the aim is to find a way to easily add content to Jekyll so that I can phase out both and keep all content here, optionally replicating it in other networks.

You can check the code here: [ricardochavezt/ricardochavezt.com](https://github.com/ricardochavezt/ricardochavezt.com)

### Friday Songbird 🎵

One of my <a href="/projects-other" class="internal-link">non-software projects</a>, Friday Songbird was a music blog that was not hosted on a blogging platform, but instead on [Ctrl-C.club](https://ctrl-c.club/), and as such, was crafted by hand using an earlier version of the [Gatsby framework](https://www.gatsbyjs.com/) to generate a static site. Due to the limitations of Ctrl-C.club and me wanting a web interface to write the posts 😅, I created a quite basic <abbr title="create, read, update, delete">CRUD</abbr> interface using the [Flask](https://flask.palletsprojects.com/en/stable/) web framework for Python (chosen because I had used it a lot in my previous job and wanted a quick solution 😅), deployed it to [Heroku](https://www.heroku.com/), and then modified my Gatsby project to retrieve the data for the static generation from the API exposed by the backend instead of the default (Markdown files). No automatic generation though; once I finished writing a post, I logged in to my Ctrl-c.club account and ran a script to regenerate the site. Very basic, but all in all, it served me well.

You can check the website project at [ricardochavezt/friday-songbird](https://github.com/ricardochavezt/friday-songbird) and the backend project at [ricardochavezt/friday-songbird-backend](https://github.com/ricardochavezt/friday-songbird-backend).

### The bots 🤖

These are small projects, deployed as [AWS Lambda](https://aws.amazon.com/es/lambda/) functions, that I use to send reminders to myself, usually to revisit things or periodically save stuff:

- [Link Exploring Bot](https://github.com/ricardochavezt/link_exploring_bot): this trusty bot, written in Ruby, ran daily to check in a MongoDB database that held the links I used to keep in my [Delicious](https://del.icio.us/) account, retrieved the ones that were saved on the same day and month as the current date, checked if they were still active (by checking if an HTTP request returned a successful response), and emailed me the ones that passed the check, so I can review them and decide what to do.  
(Currently inactive since it has finished reviewing all the links in the database.)

- [On Repeat bot](https://github.com/ricardochavezt/on_repeat_bot) (a.k.a. "this month in music"): this trusty both, written in Javascript, ran once a month and used the Spotify API to retrieve the contents of my "On Repeat" playlist and email them to me, because I always felt that the Spotify Wrapped did not accurately reflect the songs I used to listen across the year 😁.  
(Sadly, Spotify cut API access to the algorithmically generated playlists, which broke this little bot ☹️; it has been repurposed to send me an email reminder to save my On Repeat playlist each month.)

### The Bot of Wall Street 📈

Not a bot in the same sense as the above projects, this was a project developed for the Software Engineering for Autonomous System course at [Università degli Studi dell'Aquila](https://www.univaq.it/en/index.php?&lang_s=en) as part of the second year of my masters ([EDISS](https://www.master-ediss.eu/)). It was an autonomous stock trading system that kept track of (historical) stock prices and used machine learning to try to detect trends and optimize investment returns; it employed the <abbr title="Monitor, Analyze, Plan, Execute - over shared Knowledge">MAPE-K</abbr> framework for autonomous systems, with each component implemented using Python and communicating through a message broker, and using [Docker Compose](https://docs.docker.com/compose/) to orchestrate everything. The project succedeed in getting us the highest grade on the course, but failed to make us millionaires 😆.  
(Still counts as a win in my book.)

You can check the project's code at [ricardochavezt/the-bot-of-wall-street](https://github.com/ricardochavezt/the-bot-of-wall-street)

### Advent of Code 🎄

Since 2018, I've taken as a personal challenge to try my hand at the well-known [Advent of Code](https://adventofcode.com/) challenge, using it as an interesting way to keep my coding abilities sharp and to learn something new from the more algorithmic side (I think it was here that I first learned about the [Manhattan distance](https://en.wikipedia.org/wiki/Taxicab_geometry)). Depending on how much free time I have at my disposal, I have managed to get almost halfway through in most cases, before the usual end-of-year craziness sweeps me up; the only notable exceptions have been 2022, which I skipped most likely because I was on a year-end trip, and 2024, in which my unemployment meant I had enough time to break my record and get all the way to day 21.

The small, well-defined challenges also were a nice excuse to try out different languages that I might not have had the opportunity to try before or on a regular basis, which is why the first years include a mix of Javascript, Go, Ruby and even Kotlin and Typescript. In later years I have defaulted to a more familiar language (Python), maybe to center more on the challenge.  
(And let's not forget 2021, in which I decided to do the entire thing in Haskell, which I had never used before; that was quite a brain-stretching exercise 😄.)

You can check the code by [searching for the word 'advent' in my repositores](https://github.com/ricardochavezt?tab=repositories&q=advent&type=&language=&sort=).