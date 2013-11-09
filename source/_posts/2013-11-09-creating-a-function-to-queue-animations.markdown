---
layout: post
title: "Creating a function to queue animations"
date: 2013-11-09 21:09
comments: true
categories: [JavaScript, animation]
---

I've been trying to build a presentation today and I'm at *that* stage where I just want to build everything in a browser. It really doesn't matter to me that a task might be ten times harder and take twice as long to implement in a browser, it's the challenge I enjoy. The fact is that I feel more comfortable in Chrome than I ever have in PowerPoint or Word or something like that, plus doing something I've never done before introduces me to new programming concepts that I otherwise wouldn't have discovered for a while. 
 
Anyway, that's the back story to this post and I apologise for the little ramble there, I'm told I just do that sometimes. So what I wanted to build was a function that would step through a series of animations and execute them depending on the time the whole animation process started. Are you with me? 
 
## .animate() 
 
I know what your thinking *'Connor just use jQuery's animate method'* and that would be a sensible statement. After all, we can queue different effects by taking advantage of chaining and jQuery's delay method. 
 
 
``` javascript 
$names.fadeIn(300).delay(500).fadeOut(300) 
``` 
 
The above code works as expected, it fades in some element references by `$names` then it waits for half a seconds and fades it back out again. That was easy. The problem with this approach is that it's too focused around the one element the animation sequence starts from. What if I then want to trigger some custom event right at the bottom of the page? Sure, I could use chaining again to traverse the DOM to find that element but that takes a lot of effort and quickly we'll notice our code becoming extremely brittle even for 2 or maybe 3 animations. No this won't do, we need a new approach. Bring on `setInterval()`.. 
 
## setInterval() 
 
[setInterval](https://developer.mozilla.org/en-US/docs/Web/API/Window.setInterval) is one of the three JavaScript timers and is the one you should use if you want an action to happen repeatedly. So after a few attempts I finally have a simple yet effective animate method working correctly. Here it is. 
 
``` javascript 
var animate = function() { 
  var duration = 60000, // animation has to last 60 seconds 
      interval, // our interval id 
      counter = 0; //  
 
  interval = setInterval(function() { 
    // get how many seconds are left then invert it 
    // to calculate the current time since the animation started  
    var elapsed = duration - (duration - (counter * 1000)); 
         
        // do something at... 
    if(elapsed === 5000) // ...5 seconds 
    if(elapsed === 10000) // ...10 seconds 
    if(elapsed === 50000) // ...50 seconds 
        // could also use 
        if(counter === 5) // ...5 seconds 
 
    // if we are are at the end then stop animating 
    if (elapsed === duration) { 
      clearInterval(interval); 
    } 
 
    counter++; 
 
  }, 1000); // animate every second 
} 
``` 
 
Using this function I was able to build a presentation full of complex animations and effects with ease. I know there are other mature plugins out there that do this kind of thing such as impress.js but by building it myself I just understand it more. Plus I find it very rewarding to build things like this. 
 
So that's it for this post. I'm not done playing with timing functions just yet though, I really want to try and build some animating particle system using `requestAnimationFrame` but that's for another post.