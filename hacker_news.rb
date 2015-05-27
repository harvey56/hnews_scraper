#! usr/bin/env ruby

require 'open-uri'
require 'mechanize'
require 'mail'
require 'launchy'

class Hnews
	URL = 'https://news.ycombinator.com'
	@@parsed = false

	def in_terminal
		#print ynews in the terminal
		parse
		@selection.each_slice(2) {|x| puts x.join}
	end

	def save
		#write ynews to a local html file
		news_file = open("hnews.html", "w+")
		if @@parsed == false
			parse
		end
		news_file.write(@page)
		news_file.close
		puts "The latest Hacker news have been saved in your current folder here :", Dir.pwd
	end

	def select(id)
		#open the news of your choice in your Internet browser
		if @@parsed == false
			parse
		end
		Launchy.open(@selection.css('a')[id.to_i]['href']) do |exception|
			puts"you can only open one of the latest news as listed between id 1 and id 30"
		end
	end

	def email_news(from, to)
		Mail.deliver do
			from from
			to to
			content_type 'text/html'
			charset = 'UTF-8'
			subject 'Ycombinator news'
			body @page
		end
	end
	
	private

	def parse
		@page = Nokogiri::HTML(open(URL).read);
                @selection = @page.css('tr.athing td.title');
		parsed = true
	end

end	
