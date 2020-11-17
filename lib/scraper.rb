require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    binding.pry
    # student_profile = doc.css(".student-card")
    # name = doc.css(".student-card").css(".student-name")
  end

  def self.scrape_profile_page(profile_url)

  end

end
