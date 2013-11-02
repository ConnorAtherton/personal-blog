---
layout: post
title: "Exploring CSS Syntax"
date: 2013-11-02 13:53
comments: true
categories: [SASS, CSS]
---

Over the past few months I've been writing a lot of SASS and I've noticed there's a few different ways to write styles, some better than others. In this post we'll see three of the most popular and then you can decide which one you like best.

All the examples I'll use here are SASS because that's what I've been using recently. For those of you who haven't used SASS, it's like CSS on steroids, like really high end super expensive steroids. It actualy makes writing maintainable CSS fun.

I should also mention there is LESS, an alternative to SASS that is also highly regarded in web circles. I haven't used it yet so I can't really comment on how good it is but from what I've read it's also pretty sweet.


## An imaginative story to set the scene

Right, down to business. Writing CSS isn't so bad, it's okay as long as it's properly formatted. Imagine the scenario. Your searching on GitHub and you come across a really interesting project, you do what any open source ninja would do and go right ahead and fork away. You browse the open issues and come across a simple one labeled *noob*, exactly what you want.

All that's required is to modify a few styles in a few different places, sounds easy, almost too easy. So you look in the styles directory and see there is like 50 partials. Not a bad start. You open the file you need, say `_modals.scss` and **HOLY MOTHER OF TABLE LAYOUTS! WHAT IS THIS**. Upon looking at this unweildy set of horrific style declarations you make the very easy decision to scrap this whole plan. You delete your forked repo on GitHub and pretend none of this ever happened.

Okay, so maybe that example was a little over dramatic (*just a little*) but I think it made the point that if you want to work in a team on a project then you need to learn how to format styles properly so they are readable and maintainable.

## The good 'ol multi-line format

This is the most popular format for SASS and it's a selector followed by a brace with style declarations starting on the next line and the closing brace on it's own line.

``` SASS
.separator {
  content: "\2022 ";
  padding: 0 .4em 0 .2em;
  display: inline-block;
}
```

This code is taken from the theme this very blog is using and one thing to notice is that there is always a space between the selector expression and the opening brace. This isn't enforced by syntax it's just convention. For those of you who do any serious programming this style will seem familiar to you, it's conventional for control statements to be written this way, it's often referred to as the K&R style. 


## The hanging brace

This one isn't as popular as the format above but you will see it around sometime. This kind of formatting is very popular with `PHP` programming. Mainly because it gives the code a **'grouping'** feel to it. I feel like SASS is more readable using this method.

Here is the same code as above but in the new style.

``` SASS
.separator 
{
  content: "\2022 ";
  padding: 0 .4em 0 .2em;
  display: inline-block;
}
```

Okay so we haven't done much here so let's take a better example. What you see below is more complicated and looks pretty cluttered. Look what happens when we change to hanging braces.

``` SASS Opening brace on same line
#blog-archives {
  article {
    padding: 1em 0 1em;
    position: relative;
    &:last-child {
      background: none;
    }
  }
  h1 {
    font-size: 1.5em;
    a {
      @include hover-link;
      color: inherit;
      &:hover { color: $link-color-hover; }
      font-weight: normal;
      display: inline-block;
    }
  }
  a.category, time {
    @extend .sans;
    color: $text-color-light;
  }
  color: $text-color-light;
  time {
    font-size: .9em;
    line-height: 1.2em;
    .month, .day { display: inline-block; }
    .month { text-transform: uppercase; }
  }
  p { margin-bottom: 1em; color: $link-color-hover; }
}
```

``` SASS Opening brace on next line
#blog-archives 
{
  article 
  {
    padding: 1em 0 1em;
    position: relative;
    &:last-child 
    {
      background: none;
    }
  }
  h1 
  {
    font-size: 1.5em;
    a 
    {
      @include hover-link;
      color: inherit;
      &:hover { color: $link-color-hover; }
      font-weight: normal;
      display: inline-block;
    }
  }
  a.category, time 
  {
    @extend .sans;
    color: $text-color-light;
  }
  color: $text-color-light;
  time 
  {
    font-size: .9em;
    line-height: 1.2em;
    .month 
    { 
      text-transform: uppercase; 
    }
  }
  p 
  { 
    margin-bottom: 1em; 
    color: $link-color-hover; 
  }
}
```

Placing the brace on the next line makes it easy to see what pair of braces match but SASS just doesn't look as elegant formatted this way. I can't quite put my finger on what makes me slightly dislike this method for SASS, maybe it's because it makes nesting (*one of the best features*) look a bit awkward. 

## The one liner

This one is less common than the other two but I have seen it around. There was a really good blog post I read where the author argues in favour of this approach but for the life of me I can't remember where I read it. If I find it I'll put it at the bottom of this post.

This format requires that your two braces be on the same line with all style rules in between like this;

``` SASS
.separator { content: "\2022 "; padding: 0 .4em 0 .2em; display: inline-block; }
```

Notice the spacing between the different rules. However, even with the spacing this is so much harder to read and here we are using three rules. Imagine if there were 9 or 10! I dread to think how unreadable that would be. However, on the plus side it keeps the file nice and concise. 

My advice would be to use this format only if there is only one or two rules because then it is actually eadier to read as one line. Any more than two then it's best to use one of the first two. 


``` SASS
// this..
.month 
{ 
  text-transform: uppercase; 
}

//..is more readable like this
.month { text-transform: uppercase; }
```


Ultimately, you just **need to be consistent**. If you start writing a style sheet using the first method don't suddenly switch to the second method. That's a big no no, you'll get no stickers if you do that and you'll just confuse people and we don't want to do that now do we.



