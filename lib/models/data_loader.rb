class DataLoader
  def initialize
  end

  def get_data(filenames)
    data = filenames.map do |filename|
      data_scraper = Datascraper.new(filename)
    end
  end

  def load_data(data)
    
  end
end
