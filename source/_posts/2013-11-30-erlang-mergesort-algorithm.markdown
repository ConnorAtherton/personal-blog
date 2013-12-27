---
layout: post
title: "Erlang Mergesort Algorithm"
date: 2013-11-30 21:36
comments: true
categories: [Erlang, Function Programming, Lists]
---

During the past two weeks I've been introduced to Erlang, a functional programming language. I've only ever briefly used functional programming and that was in Scheme
a few months back and I didn't really enjoy that. Probably because it seemed a bit foreign to me ,being mainly a web developer, for nearly everything to be implemented using recursion!

It wasn't that I didn't think Scheme was a good language, I was just so used to programming in an imperative style that it took me quite a while
to adjust to a functional way of thinking. I mean I take for granted every day the fact that it's possible to assign new values to variables but you
can't do that in Scheme or Erlang or any other functional language. It's fair to say that it takes some getting used too.

So in one of my assignments I was told to create a merge short algorithm and below is what I came up with. My solution is tail recursive
and I've tested it with all the cases I could think of so I'm pretty sure it does work.

``` erlang Erlang Merge Sort
-module(mergesort).
-export([mergesort/2]).

% CALLS TO WRAPPER FUNCTION

% mergesort used when there is actually only one list passed.
% Splits into two lists and calls general mergesort .
mergesort(List) ->
    % I used this before I realised I could
    % just use lists:sort() to return the list
    % Splitpoint = length(List) div 2,
    % {Left, Right} = lists:split(Splitpoint, List),
    % mergesort(Left, Right).
    lists:sort(List).

% Merge sorting two empty list is just an empty list
mergesort([], []) -> [];

% Merge with only one list
% Split list into two and call merge
mergesort(Left, []) ->
    mergesort(Left);

mergesort([], Right) ->
    mergesort(Right);

% merge sort with two full lists
% before merging sort the lists into
% ascending order
mergesort(Left, Right) ->
    Sortedleft = lists:sort(Left),
    Sortedright = lists:sort(Right),
    merge(Sortedleft, Sortedright, []).

% ACTUAL WRAPPER FUNCTION

% terminating case when all elements have been sorted
merge([], [], List) -> lists:reverse(List);

% No Right list left
merge([L|Left], [], List) ->
    merge(Left, [], [L|List]);

% No Left list left
merge([], [R|Right], List) ->
    merge([], Right, [R|List]);

% General recursive case 1
% if the Right head is less than the left
% add it to our sorted list and remove it
% from the original list
merge([L|Left], [R|Right], List) when R < L ->
    merge([L|Left], Right, [R|List]);

% General recursive case 2
% If we are in this case then the
% right head isn't less than and no guard
% is required because we know we can just
% add it to the list
merge([L|Left], Right, List) ->
    merge(Left, Right, [L|List]).
```

