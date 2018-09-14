require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  attr_accessor :name, :location, :profile_url

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    student= doc.css(".student-card")
    student.map do |student|
      student_name = student.css("a div.card-text-container h4.student-name").text
      student_location = student.css("a div.card-text-container p.student-location").text
      student_url = student.css("a[href]").first['href']
      student_info = {name: student_name, location: student_location, profile_url: student_url}
      student_info
    end
  end

  def self.scrape_profile_page(profile_url)

  end

end

#Scraper.scrape_index_page("./fixtures/student-site/index.html")
