require 'rubygems'
require 'nokogiri'
require 'open-uri'

PAGE_URL = "https://en.wikipedia.org/wiki/HTML"
page = Nokogiri::HTML(open(PAGE_URL))

links = page.css('//*[@id="mw-content-text"]/div/table/tr/th/a')
links.each{|link| puts link["href"]}
