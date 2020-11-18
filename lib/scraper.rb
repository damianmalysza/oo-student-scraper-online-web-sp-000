require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    #loading the HTML element using Nokogiri and storing in a 'doc' variable
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    #iterate over each student card and collect array of hashes
    doc.css(".student-card").collect {|student| {name: student.css(".student-name").text, location: student.css(".student-location").text, profile_url: student.css("a").attr("href").text}}
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    return_hash = {}
    social_media = doc.css(".social-icon-container").css("a")
    social_media.each do |social|
      return_hash[social.attr("href")[/(?<=\/{2})(.*?)(?=\.)/]] = social.attr("href")
      binding.pry
    end
    #binding.pry
    # social media: doc.css(".social-icon-container").css("a").attr("href")
  end

end
