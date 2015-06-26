Emacs Prelude Customized By Hanks
=================================

This is a modified version of Prelude for me. You can check the original awesome Emacs settings <a href="https://github.com/bbatsov/prelude">here</a>. I use Emacs for a long time, but just for the simple usage, and base on my own configurations collected from internet, actually speaking it is a little buggy. When I checked Prelude and other emacs package repos, I just want to say `It's rocks`. So I decided to use this repo to manage my Emacs settings.

**Table of Contents**

- [Addtional Features](#addtional-Features)
- [Demo](#demo)
- [Installation](#installation)
    - [Installing Emacs 24](#installing-emacs-24)
    - [Installing Modified Prelude](#installing-modified-prelude)
- [Run](#run)

## Addtional Features

Base on Prelude settings, I add some features below:  

* linum+, show line number
* YASnippet, yet another snippet
* auto-complete, as its name...
* tabbar, add tab bar at the top of window
* cursor-change, smart cursor
* instant jump, trivial script created by myself to do directly new line and indent
* ...

You can check details in ~/.emacs.d/personal/customize.el

## Demo
![demo](https://raw.githubusercontent.com/hanks/prelude/master/demo/demo.gif)

## Installation

### Installing Emacs 24

Obviously to use the Emacs Prelude you have to install Emacs 24
first. Have a look at the [WikEmacs articles on installing Emacs](http://wikemacs.org/index.php/Installing_Emacs).  

After you install the original Emacs 24, and **Do Not Open It** and execute the steps below.

### Installing Modified Prelude 

```bash
cd ~
export PRELUDE_URL="https://github.com/hanks/prelude.git" && curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
```

## Run
At this time, just open Emacs and wait, and it will do the configuration automatically. Then Happy Coding!