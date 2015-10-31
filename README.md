# Hacker news scraper

## Description

This is a short scrit written in Ruby. It does not do wonders :-o. It was written mostly for fun and to gain a first hands-on experience with Ruby and with the several gems involved.

## Features

What that script does is it allows you to :

	* scrape the list of news from Hacker news (source of various tech related news)
	* record the news on your disk
	* display the news in your terminal in IRB
	* select one of the news displayed in your IRB and open it in your Internet browser
	* Email the news saved on your disk to a recipient of your choice

## Use

At this stage, you can use it in IRB.
Import the script with :

	% require './hacker_news.rb'

Create a Hnews object :
	
	todaysnews = Hnews.new

Display the latest news in the terminal :

	todaysnews.in_terminal

Show one of the news in your Internet browser :
You have to select one of the news with a 1 < id < 30

	todaysnews.select(id) 

Save the news to your disk :

	todaysnews.save

Email the news :
parameters are email addresses

	todaysnews.email_news(from, to)

## Contributing

Feel free to share your support if you feel like contributing this.

 
