require 'nokogiri'
class DataScraper
  attr_reader :filename, :raw_html, :page

  def initialize(filename)
    @filename = filename
    @raw_html = File.read(filename)
    @page = Nokogiri::HTML(raw_html)
  end

  def title
    page.css('title').text.strip
  end

  def header
    page.css('header').text.strip
  end

  def h2
    page.css('h2').text.strip
  end

  def body
    page.css('div.main_body').text.strip
  end
end
