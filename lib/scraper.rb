require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))
    return_array = []
    binding.pry
    student_profile = doc.css(".student-card")
    student_profile.collect do {|student|}
      return_array << {name: => student.css(".student-name").text, location: studnet.css(".student-location").text, profile_url: student.css("a").attr("href").text}
    end
    # name = student_profile.css(".student-name").text
    # location = student_profile.css(".student-location").text
    # student_url = student_profile.css("a").attr("href").text
  end

  def self.scrape_profile_page(profile_url)

  end

end
