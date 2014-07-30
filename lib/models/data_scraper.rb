require 'nokogiri'
class DataScraper
  attr_reader :filename, :raw_html, :page

  def initialize(filename)
    @filename = filename
    @raw_html = File.read(filename)
    @page = Nokogiri::HTML(raw_html)
  end

  def format_input(text)
    pure_text = text.gsub(/\t/, '')
    pure_text.strip
  end

  def get_text(attribute)
    text = page.css(attribute).text
    format_input(text)
  end
end
