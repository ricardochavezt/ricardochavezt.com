---
title: Using Sparkles to post across devices
excerpt: <p>Been using Sparkles for a few weeks and liking it so far, so here's my setup for using it to post from different devices:</p>
---
Been using [Sparkles](https://indieweb.org/Sparkles) for a few weeks and liking it so far, so here's my setup for using it to post from different devices:

Prerequisites: Sparkles is a [Micropub](https://indieweb.org/Micropub) client and uses [IndieAuth](https://indieauth.net/) to authenticate against your website and post to it, so you would need those two technologies set up. I'm using [IndieKit](https://getindiekit.com/) myself, which takes care of both.

Android: by far the easiest. After setting up IndieKit, just go to https://sparkles.sploot.com/ using Chrome, log in using your website, and add the site to your home screen. Since Sparkles is a [progressive web application](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps/Guides/What_is_a_progressive_web_app), it will show up as a share target and will let you chose how to share whatever you want to share (as a like, bookmark, RSVP or reply).

Desktop: since it is a Web application after all, with a bit of reverse engineering, I managed to create a bookmarklet that opens the same page that is used when sharing in Android, so I can share whatever I am reading / watching on my browser with a click on my bookmarks bar. And you can too! Just drag this to your bookmarks bar: <a href="javascript:(function()%7Bvar title=document.getElementsByTagName('title')%5B0%5D.innerHTML;name=encodeURIComponent(title);var newUrl='https://sparkles.sploot.com/share?title=%27+name+%27&url=%27+encodeURIComponent(document.location.href);new_window=window.open(newUrl,%27Post%20with%20Sparkles%27,%27resizable,scrollbars,status=0,toolbar=0,menubar=0,titlebar=0,width=720,height=578,location=0%27);%7D)();">Post with Sparkles</a>.

iOS: this was a bit more involved. I first tried to use the first iOS Shortcut listed here: [iOS Shortcut Actions for Micropub posting](https://cagrimmett.com/2023/02/12/ios-shortcut-actions-for-micropub-posting/), but I had a hard time generating the Micropub token just to have it expire after a while -\_-, so I edited the shortcut to just open the Sparkles page that corresponded to each post type (since it has URLs for creating each, such as `/new/bookmark`). And you can also use this! (isn't it wonderful? :D), just open this link in your iOS device: [Post with Sparkles](https://www.icloud.com/shortcuts/9e41e2244e6f4f958803d04aaa16df07).

And that's it. If something fancier comes along, this page will get updated (b'-')b