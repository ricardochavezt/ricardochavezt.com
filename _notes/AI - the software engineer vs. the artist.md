---
title: AI - the software engineer vs. the artist
excerpt: <p>My thoughts on the recent wave of generative AI advancements, both as a software engineer and as a person deeply interested in creativity</p>
---
(**Note**: this has been written to participate in the [IndieWeb Blog Carnival of February 2026](https://zacharykai.net/notes/icfeb26), whose topic is "Intersecting Interests". But since this note is part of a digital garden (see [[About this garden]]), it might evolve over time. I can promise that, as of the end of February 2026, it is complete enough to be publicly posted, mainly because I would feel bed about submitting just a bunch of links and bullet points to the Blog Carnival 😅)

I'd like to gather my thoughts on the recent wave of developments in generative AI because I find myself in this very weird place:
- On one hand, I'm a software engineer _and_ a few years ago I completed a masters which covered the topics of AI and data science, so I have some technical knowledge of the inner workings or generative AI and a fascination with the technology from a technical / academical point of view
- On the other hand, I have always been interested in the topic of creativity, and one of my main hobbies is drawing; as such, I hear a lot of voices from artists and creative people who are terrified, disgusted or in open rebellion against AI

So this should serve to organize my ideas on the topic in public and -- hopefully -- draw some conclusions. And, as it always happens, more talented people have already put their thoughts more eloquently than me, so I shall link to them in the hopes that their thoughts could help mine grow.

(**Disclaimer**: in case it is not obvious, this page has been entirely written by yours truly, without any help from any generative AI tool. Because imagine how *ridiculous* would it be to want to organize my thoughts on the subject and then just grab a bunch of links and tell any LLM "hey, sum this up for me and write some conclusions"... Those wouldn't be _my_ thoughts, would they?)

On the 'for' camp (as in, what has AI going for it):
- it is indeed a fascinating technology (LLMs seem to have [emergent](https://en.wikipedia.org/wiki/Emergence) properties - they were not initially created to generate text, just to predict tokens for translation!)
	- Explained quickly and badly 😅, LLMs are just spreadsheets on steroids that can give you a prediction of the next word that should follow a stream of text, kinda like what your predicting keyboard on your phone does ([OpenAI](https://openai.com/index/better-language-models/): "Our model (...), was trained simply to predict the next word in 40GB of Internet text."). What the researchers did was basically ask: what happens if we give the model a question and ask it to predict the next words? And _voilà_, out popped the answer to said question.
- BUT there is also a lot of hype around it, and a lot of people jumping onto the hype train, _and_ a lot of people disparaging it _because_ of the hype

On the 'against' camp:
- it threatens the livelihoods of artists (who sometimes already struggle to earn a living from their work)
	- it can be argued that not only artists' livelihoods are being threatened -- programmers (like yours truly) might find themselves on the same boat, with all these models that can now generate code
- it is being unnecessarily pushed almost everywhere by people either jumping on the train to not get left behind or people trying to get a quick buck out if it
	- Copilot on Microsoft Teams, anyone? I've lost count of the number of times I clicked on the "No" option to add it to the sidebar or so, and it keeps popping up. (I think in the end it just ignored me and lodged itself there anyways 😑)
- there's also the question: why is it going for the creative pursuits? ("AI was supposed to do my laundry so I could have more time to do art, not the other way around")
	- I have this image that the people working on these models just found out about what they can do and went "hey, look at this nifty thing!", and then the general public started using it for unexpected things and declaring that so-and-so profession is dead, and the researchers are now looking like [that frame from the Oppenheimer movie](https://fwmedia.fandomwire.com/wp-content/uploads/2023/12/30072909/oppenheimer-1.webp) 😆

The burning question that pops up in my head, since I find myself in the weird place described above: is there a way to bridge this divide? To tell the technical people "hey, watch out! this might also be harmful!"? To tell the artists "hey, don't worry, this can be used for good too!"?

My point of view, in general, is this: these are all *tools*, and should be treated / analyzed as such. As Hannah Fry so eloquently puts it, "[AI can do superhuman things, but you know, so could forklifts](https://youtube.com/shorts/AWLVcrjn6fo?si=3x_lFpM8QdYhIvM9)".  
(And you need to be forklift-certified to operate a forklift[^1], lest you endanger yourself and other around you)
- Interesting point in that video: since these models handle language, and humans are wired for language and social connection, we more easily anthropomorphize them and more easily forget that they are simply tools.
- If these are indeed tools, then something interesting to explore would be: what happened when more modern tools replaced older ones? For example: what happened when self-propelling vehicles replaced horse-drawn ones?
	- did horse riders adapt and learn how to drive the new engine vehicles?
	- horse-riding did become somewhat of a niche activity, only for special circumstances (or for rich people) -- will the same happen to art?
	- my only worry would be that this question might prompt the pro-AI people to tell the artists to simply "adapt or die" 🙁 (insert meme of "the future is now, old man" 😆)
- From this point of view, the answer to the (burning) question above might be: let's start regulating the use of the tools, so that the technical people can't go down the harmful avenue, and the artists can be taught the right way to use these tools that doesn't go against their livelihood
	- [80,000 Hours](https://80000hours.org/), the non-profit focusing on helping people find high-impact careers, argues that [AI governance and policy could be a high-impact career path](https://80000hours.org/career-reviews/ai-policy-and-strategy/#why-this-could-be-a-high-impact-career-path), maybe more than other, more technical career paths.
	- My prediction (if I dare make one) is that, after all the hype recedes, policymakers will step in and regulate the uses of AI -- then the only thing we need to do is make sure the policymakers make sensible decisions and are not guided by the companies creating the AI products

What some other voices are saying:

[Austin Kleon](https://austinkleon.com/), one of my favorite authors (especially on the topic of creativity), has several posts on the topic:

- [AI as intern](https://austinkleon.com/2023/03/22/ai-as-intern/): the most convincing case, for him, is treating these generative AI models as interns or assistants -- one step further than a mere tool, maybe, but still, their output needs to be reviewed and should be used as a starting point, not as a complete result.
	- Related: [this tweet](https://x.com/addyosmani/status/1950457229171384821?s=20) from [Addy Osmani](https://addyosmani.com/) (which I reposted [on Tumblr](https://www.tumblr.com/ricardochavezt/790857948577562624/in-other-words-treat-your-ai-coding-assistant-as?source=share)) that basically says the same, but applied to software engineering, i.e. do all the stuff they teach you on Software Engineering 101 (and that no one does anymore because it may be tried and tested but it's not shiny and new), feed it to the AI, and then review the result *always*.[^2]
- [AI can’t kill anything worth preserving](https://austinkleon.com/2023/01/12/ai-cant-kill-anything-worth-preserving/): the title says it all: for all those pundits saying "X and Y thing is dead" because of AI, maybe in some cases we should say "good riddance". In a way, then, creative pursuits are not really in danger because of AI, for the important part -- the human element -- cannot be truly replaced. We should "honor what is not machine-like" in us, because that is precisely what cannot be replaced.
	- "People keep asking me about AI and I really think how you feel about AI comes down to whether you believe art is about producing things (images, objects, data files, “content”) or about a way of operating in the world as an intellectual, spiritual, and emotional creature."
	- Relates also to point 2 of the [12/05/2025 edition of his newsletter](https://austinkleon.substack.com/p/open-rebellion) (which links to the essay [AI slop predates AI](https://ethanhein.substack.com/p/ai-slop-predates-ai)) -- these models are trained on the sum of human work, so they produce average / derived results -- and innovation and the uniqueness of human art happen precisely _outside_ the average, on the fringes that these tools cannot reach.

(He also has a post about assistive technologies and how they end up being used and benefitting more than their original intended audience: e.g. accessibility ramps for wheelchair users or closed captioning for people with hearing disabilities, etc. -- will update the link here when I find it. The main point is: how can we decide what is the "right" way of using these technologies? Are we watching ramps to make sure only people in wheelchairs use them, or asking "do you have any hearing disabilities?" every time anyone turns on closed captioning for a video?)

Cartoonist [Jason Chatfield](https://www.newyorkcartoons.com/) has a post on his newsletter titled [The Slow Burn of "Mastery"](https://open.substack.com/pub/newyorkcartoons/p/the-slow-burn-of-mastery) that states a point I 100% agree with: the important thing is the _process_, not the output. "A machine can mimic the result of expertise, but it can’t replicate the *journey* of expertise." (emphasis mine.) So even if said machine can produce the output in a fraction of the time, the most impactful thing is the process, the 10 000 hours it took someone to achieve a level of mastery in any creative endeavor.
- or maybe there's two ways to look at it: if you care only about the output, then AI will be useful; if you care about learning / the process, then AI can even be harmful
	- is there a "right" way to care about the output more than about the process? e.g. if you can't draw or don't have the time to make nifty drawings for your presentation at work (can't ask your colleagues to spend 10 years mastering drawing just because they want to perk up their Monday presentation) vs. if you only want to make a quick buck by generating slop
	- this goes back to the topic of policy and regulation -- how do we allow what is useful and stop what is harmful?
- this take is also more in the personal development camp: taking up creative endeavors not because of the output but because of what they teach you or the effects they have on you
	- example staring right at my face 😆: why people still take up running or cycling when we have cars and public transportation? because the point is not getting from A to B, is exercising so you stay healthy
- As the awesome webcomic [Dresden Codak](https://dresdencodak.com/) once put it [here](https://dresdencodak.com/2020/08/31/dark-science-100-the-dark-scientific-method/): "You're not paying for 10 seconds, you're paying for 10 years of drawings that allowed for this drawing"

(-- FIN -- thanks for reading this far 😃)

[^1]: Or so the Internet tells me 😁

[^2]: Of special interest to me are all the AI hater comments I received on the post on Tumblr (maybe the most I have ever received on there), mainly because I was not even praising AI, I was merely restating the post as I understood it. But hey, haters gonna hate xD
