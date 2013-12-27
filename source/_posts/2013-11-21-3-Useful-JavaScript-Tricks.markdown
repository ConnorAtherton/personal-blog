---
layout: post
title: "3 Useful JavaScript Tricks"
date: 2013-11-21 17:39
comments: true
categories: [JavaScript]
---

JavaScript is a language well known for it's little hacks and tricks that help get things done on a project. In some cases they can turn ugly if statements into elegant one liners but in others they can just be overkill. It all comes down to a trade off between elegance and code readability.

In this post I want to show you three common little tricks used by JS hackers.

# Short Circuiting

``` javascript
robot && robot.fight()
```

This is often referred to as "short circuiting" a logical operator. Think of it as a ternary operator but with no else condition. The first part is evaluated, in this case it's `robot`, if it's a `truthy` value the second part is then evaluated. This works because the logical `&&` operator needs both of its operands to evaluate to a `truthy` value, if the first one isn't then it doesn't even have to evaluate the second one to know the whole expression will evaluate to `false`

This could also be written like this.

``` javascript
if (robot) {
	robot.fight();
}
```

# Double Tilde

The double tilde if often used with floats like this.

``` javascript
~~3.14 // outputs: 3
~~1.6 // outputs: 1
```

Wait a minute, that looks familiar, doesn't JS have another function that does that? Try running Math.floor() passing in the same values as above and see what happens, the same values are returned. It is a little obscure and in most cases Math.floor() is probably the better choice but `~~` does come with some [performance benefits](http://jsperf.com/tilde-vs-floor).

# Boolean Casting

Values in JavaScript can be two different types, `truthy` or `falsy`, and it gets quite complicated to know what a value actually evaluates too ([see here](http://www.sitepoint.com/javascript-truthy-falsy/)). However, by places `!!` before an expression we can find out if it evaluates to true or false based on this rule. *If `!!expression` is `truthy` it evalutes to true and false otherwise.*

``` javascript
// Remember every string except an empty string in JS is truthy
var string = "string";

string === true // false
!!string === true // true

// also this is also equal
Boolean(string) === !!string
```

The first `!` here coerces the value to an inverted boolean value and the second `!` then converts that back so we get returned a boolean representation of our original expression.

Both `!!` and `~~` are not themselves operators, they are just the `!` and `~` used twice on the same expression.

I find these help a lot when trying to understand libraries or plugins written in JavaScript.





