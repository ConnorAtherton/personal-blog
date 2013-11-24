---
layout: post
title: "Introducing OctoPanel"
date: 2013-11-03 14:18
comments: true
categories:
---


This project all started when I stumbled across OctoPress, a blogging framework for Jekyll that describes itself as **a blogging framework for hackers**. That sounds good doesn't it? I've created blog themes in the past but only for Wordpress and although I think it is an amazing piece of software it just didn't work for me.

I'm a coding nerd. I prefer to be in my favourite text editor (sublime text) typing away blog posts than in the browser, it's just how I like to work. So I basically fell in love with the idea of using OctoPress because it gave me the chance to

- Really get to grips with markdown syntax
- Dig into to some ruby code (I want to learn ruby)
- Create an awesome blog theme!

This theme is based on the **[Medium](http://medium.com)** layout and I've tried to keep it super simple so it has support for gravatar images, twitter sharing and disqus comments.

It's also possible to give the left panel a background-image instead of just a plain color as I have for this site.

``` SASS
@if $image == true {
  background: $left-background-image !important;
  border-right: 1px solid darken($base02, 5) !important;
} @else {
  background-color: $left-background-color;
}
```

I've released the theme on [Github](https://github.com/ConnorAtherton/OctoPanel) so if you have time please contribute and if you use the theme on your site then please add it to the [OctoPanel wiki](https://github.com/ConnorAtherton/OctoPanel/wiki/All-sites-using-this-theme)
