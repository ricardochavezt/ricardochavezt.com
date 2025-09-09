---
link: https://lego-art-remix.com/
id: 19338332-3906-8186-9815-c65b2c6145af
title: Lego Art Remix
created_time: 2025-02-07T10:06:00.000Z
cover: 
icon: 
last_edited_time: 2025-02-07T10:06:00.000Z
archived: false
created_by_object: user
created_by_id: 935f7bc2-d3ee-4e06-9953-410a80b65bfb
last_edited_by_object: user
last_edited_by_id: 935f7bc2-d3ee-4e06-9953-410a80b65bfb
---

Below is a recording of my tech talk from BrickCon 2021

If you're interested in understanding how this site works, the talk goes over the techniques and algorithms that were used

It also goes over some ideas that haven't (yet) been implemented within the tool, so it functions fairly well as a more general overview of the Lego mosaic space

You can find the slide deck used in the talk [here](https://github.com/debkbanerji/lego-art-remix/blob/master/media/Lego Mosaic Presentation.pdf) (with some updates since the talk), and if the video doesn't load, you can find it directly on BrickCon's YouTube channel [here](https://www.youtube.com/watch?v=G58ZNurxXgQ)

Loading...

These are some other articles and videos featuring Lego Art Remix

Some are quite interesting even outside the context of this tool in particular, since they go into the history of Lego mosaics

Note that some were made when the tool was older

- [#LegoArtRemix on Instagram](https://www.instagram.com/explore/tags/legoartremix/)
- [Brothers Brick Article](https://www.brothers-brick.com/2020/08/27/create-your-own-mosaic-masterpiece-with-lego-art-remix-review-interview/) (2020 Top 3 most popular feature)

What is it?

In 2020, The Lego Group released the [Lego Art](https://www.lego.com/en-us/campaigns/art) theme, which allows people to create a predetermined image using lego studs.

Lego Art Remix lets you upload your own image, and then uses computer vision to use the studs from a Lego Art set that you already have to recreate the image.

This project is not affiliated with The Lego Group

Performance and Security

The computer vision techniques used are pretty inexpensive (with the exception of optional depth map generation), and the resolutions being dealt with are naturally quite low, so as of the time of writing, the algorithm runs quite quickly. This allows for it to be run on the client, and on the machines that I tested, it ran in near real time.

The most computationally expensive part of the process, apart from depth map generation, is generating the instructions, since even pdf generation is done client side.

Since it runs almost entirely within the browser (see the [source code](https://github.com/debkbanerji/lego-art-remix)), no image data is sent to a server and so it's very secure. This also makes it much easier for me to maintain and host. The only server code consists of simple increments to anonymously estimate usage for the purposes for tracking performance in case the static deployment needs to be scaled up, and for the counter in the about section.

Even the deep neural network to compute depth maps is being run entirely within the browser, in a web worker, using a modified version of [ONNX.js](https://github.com/microsoft/onnxjs). I've compiled a version of the library based on [this pull request](https://github.com/microsoft/onnxjs/pull/228), with a small additional change I made to support the resize operation in v10. The model used is [MiDaS](https://github.com/intel-isl/MiDaS) - more specifically, the small ONNX version which can be found [here](https://github.com/intel-isl/MiDaS/releases/tag/v2_1).

**Citation for Model Used** Ranftl, René, Katrin Lasinger, David Hafner, Konrad Schindler, and Vladlen Koltun. "Towards robust monocular depth estimation: Mixing datasets for zero-shot cross-dataset transfer." (2020). *IEEE Transactions on Pattern Analysis and Machine Intelligence*

Bugs, Feature Requests, and Algorithm Improvements

*Direct any concerns or ideas for improvements **[here](https://github.com/debkbanerji/lego-art-remix/issues)*

As of the time of writing, I don't have all of the sets, and I haven't had much time to test. As a result, there's probably a few bugs, so let me know if you find any.

Algorithm improvement ideas are always welcome. Improvements that maintain the efficiency to within a reasonable degree would allow the algorithm to keep running on the client, which I really like.


