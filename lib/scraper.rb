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
    social_med_arr = ["twitter","linkedin","github"]
    return_hash = {}
    social_media = doc.css(".social-icon-container").css("a")
    social_media.each do |social|
      return_hash[social.attr("href").gsub("www.","")[/(?<=\/{2})(.*?)(?=\.)/].to_sym] = social.attr("href")
    end
    return_hash[:profile_quote] = doc.css(".vitals-text-container").css(".profile-quote").text
    return_hash[:bio] = doc.css(".description-holder").css("p").text
    #binding.pry
    return_hash
  end

end
