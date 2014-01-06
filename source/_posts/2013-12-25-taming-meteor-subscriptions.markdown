---
layout: post
title: "Taming meteor subscriptions"
date: 2013-12-25 20:25
comments: true
categories:
---

Recently I've been building [grader](http://grader.meteor.com), an interactive grades calculator built with the Meteor JavaScript framework.
In this post I won't be going into much detail about how I actually built the app, instead I want to focus on how I organised all my subscriptions from the
client to the server.

Meteor works by publishing and subscribing to things called collections. This is the description giving about the pubsub process straight from the docs

> Every Meteor client includes an in-memory database cache. To manage the client cache, the server publishes sets of JSON documents, and the client
> subscribes to those sets. As documents in a set change, the server patches each client's cache.

On the client we want to subscribe to a collection and then use that data for some other task, in the case of grader it was drawing svg's
based on values stored in the Mongo database. But what happens if we try and draw the graphs before the subscription is complete?

It was difficult to get my head around this at first but because Meteor loads all [legal](http://docs.meteor.com/#structuringyourapp) .js files it's quite tricky to ensure
the data is actually there before using it. However, although we can't really control load order ourselves we know Meteor loads
files in accordance with some basic rules. We can use this to our advantage.

Here's how I handled subscriptions in my app, due to the fact that Meteor is pre 1.0 and still gaining traction there aren't a lot of
standard practices when building applications so if you know a better way to do this then please reach out to me via the comments below
or twitter.

First I published data to the client.

``` javascript server/publish.js
// Publish all modules the user owns to the client..
Meteor.publish('modules', function() {
  return Modules.find({user_id: this.userId});
})
```

Now because all files in the `lib` folder get loaded first I decided to put all my subscription code in there so it would get executed as quick
as possible on startup.

``` javascript client/lib/subscribe.js
_subscriptionComplete = false;

// subscribe to all collections
Meteor.subscribe('modules', function() {
  _subscriptionComplete = true;
});
```

I have one variable that controls the state of the subscription. A possible better way to do this would be to put this variable inside an app namespace
like this to keep our code organised.

``` javascript client/lib/subscribe.js
App = App || {};

App._subscriptionComplete = false;

// subscribe to all collections
Meteor.subscribe('modules', function() {
  App._subscriptionComplete = true;
});
```

To keep it simple as I only have one subscription we'll stick with the first way. Instead of storing subscription state in a variable we could
just execute a callback that does everything we want to do when the subscription is complete, such as drawing etc, but that gets very messy quickly and ends
up with lots of nested callbacks. I prefer the variable approach.

Now if we want to draw to the page based on the data we can do it like this. Note that this only works because our `_subscriptionComplete` is a *global
variable*.

``` javascript
var timeout = Meteor.setInterval(function(){

  if(_subscriptionComplete) {
    // call function to do drawing here
    myCoolDrawingFunction();
    Meteor.clearInterval(timeout);
  }

}, 100);
```

Like I said in more complex applications with multiple subscriptions there should probably be some kind of object that keeps
track of which subsciptions are and aren't complete.



