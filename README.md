# Feeder

*A command line utility to pull RSS feeds and interact with Instapaper*

I write an [occasional blog](http://wallscorp.us/) and I like to use some tools to pull together entries my ["Reading and Learning" series](http://wallscorp.us/content/tags/improvement/).

In particular, I read a number of articles between entries and I save them to an [Instapaper](https://www.instapaper.com/) folder to find them later. Except, then, I don't want to have to open tabs and handle summaries or urls again. This tool uses [FeedJira](http://feedjira.com/fetching-and-parsing.html) to read the Instapaper folder feed, build objects, and write out a Markdown document I can then drop into my blog entries.

## Setup

* Copy `.sample.env` to `.env`
* Update `URLS=` to the urls of your choice

## Style

* [Follows thoughtbot's Ruby style guidelines](https://github.com/thoughtbot/guides/tree/master/style/ruby)
* [Style enforced with Hound](https://houndci.com/)
