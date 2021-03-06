# Docilater
[![Known Vulnerabilities](https://snyk.io/test/github/stellardoor5319/docilater/badge.svg)](https://snyk.io/test/github/stellardoor5319/docilater)
[![Coverage Status](https://coveralls.io/repos/github/StellarDoor5319/docilater/badge.svg?branch=master)](https://coveralls.io/github/StellarDoor5319/docilater?branch=master)
[![Inline docs](http://inch-ci.org/github/StellarDoor5319/docilater.svg?branch=master)](http://inch-ci.org/github/StellarDoor5319/docilater)

[![Github All Releases (Downloads)](https://img.shields.io/github/downloads/StellarDoor5319/docilater/total.svg?label=GitHub%20downloads)](https://github.com/StellarDoor5319/docilater/releases)
![GitHub contributors](https://img.shields.io/github/contributors/StellarDoor5319/docilater.svg)
![GitHub release](https://img.shields.io/github/release/StellarDoor5319/docilater.svg?label=stable%20version)
![GitHub (pre-)release](https://img.shields.io/github/release/StellarDoor5319/docilater/all.svg?label=latest%20version)
![GitHub commits](https://img.shields.io/github/commits-since/StellarDoor5319/docilater/v1.0.svg)
![Github commits (since latest release)](https://img.shields.io/github/commits-since/StellarDoor5319/docilater/latest.svg?label=unreleased%20commits)
![Github search hit counter](https://img.shields.io/github/search/StellarDoor5319/docilater/goto.svg?label=search%20hits)
![GitHub commit activity the past week](https://img.shields.io/github/commit-activity/w/StellarDoor5319/docilater.svg)
![GitHub commit activity the past year](https://img.shields.io/github/commit-activity/y/StellarDoor5319/docilater.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/StellarDoor5319/docilater.svg)

Makes creating code documentation easier for you.

## Issues & Pull Requests
| Stage | Count |
| --- | --- |
| Uncategorized | [![Waffle.io](https://badge.waffle.io/StellarDoor5319/docilater.svg?columns=inbox)](http://waffle.io/StellarDoor5319/docilater) |
| Waiting | [![Waffle.io](https://badge.waffle.io/StellarDoor5319/docilater.svg?columns=backlog,next)](http://waffle.io/StellarDoor5319/docilater) |
| Processing | [![Waffle.io](https://badge.waffle.io/StellarDoor5319/docilater.svg?columns=in%20progress,review)](http://waffle.io/StellarDoor5319/docilater) |
| Complete | [![Waffle.io](https://badge.waffle.io/StellarDoor5319/docilater.svg?columns=done)](http://waffle.io/StellarDoor5319/docilater) |

## Setup
Setting up Docilater is fairly easy to do. Simply follow the instructions below, in order, and you'll be generating documentation in no time!

1. Clone the git repository.
2. Install all the required dependencies. Do this as shown below:
    1. If you do not have [Bundler](bundler.io), install it using
        ```
        sudo gem install bundler
        ```
    2. Install our dependencies using
        ```
        bundler install
        ```
3. Run the program as described in the [launching the program](#Launching) section. This will launch the program and guide you onwards.

# Launching
It is a simple process to start Docilater.

1. Open a terminal, or connect via SSH.
2. Change your current directory to where you cloned the repository. The folder will be named "docilater" by default.
3. Run the following command:
    ```
    ruby start.rb
    ```

You will now be greeted with a screen asking for your name. Simply enter your first name, it is not saved anywhere and is only used to greet you and speak to you throughout the program. Now, you will be asked to enter where your Ruby code is stored. Enter this and complete the questions presented by the program - the answers will be automatically translated into YARD comments.

# Search
Search Docilater's source files here: [OpenSearchServer](https://search.opensearchserver.net/search/StellarDoor5319/docilater)
