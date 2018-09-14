require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student= doc.css(".student-card").first
    student_name = student.css("a div.card-text-container h4.student-name").text
    student_location = student.css("a div.card-text-container p.student-location").text
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end

Scraper.scrape_index_page("./fixtures/student-site/index.html")
