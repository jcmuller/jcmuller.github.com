---
layout: post
title: Git + Mercurial + Subversion
author: Juan C. M&uuml;ller
categories:
 - development
tags:
 - git
 - mercurial
 - subversion
 - version control systems
excerpt: This article describes how to use git with mercurial and subversion repositories as submodules.
published: false
---

TODO
	Show how to use git as the front end to mercurial and SVN

Let's first start by creating a new *git* repository.

{% highlight bash %}
$ git init
$ echo "Hello, world!" > README
$ git add README
$ git commit -m "First file!" README
{% endhighlight %}
