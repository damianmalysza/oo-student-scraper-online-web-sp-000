require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    #loading the HTML element using Nokogiri and storing in a 'doc' variable
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    #iterate over each student card
    doc.css(".student-card").collect {|student| {name: student.css(".student-name").text, location: student.css(".student-location").text, profile_url: student.css("a").attr("href").text}}
    #binding.pry
    # name = student_profile.css(".student-name").text
    # location = student_profile.css(".student-location").text
    # student_url = student_profile.css("a").attr("href").text
  end

  def self.scrape_profile_page(profile_url)

  end

end
