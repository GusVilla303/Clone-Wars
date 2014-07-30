require 'sequel'
require 'nokogiri'

class Database
  attr_reader :connection

  def initialize
    if ENV['RUBY_ENV'] == "test"
      @connection = test_connection
    else
      @connection = production_connection
    end
  end

  def test_connection
    puts "Setting up the TEST environment database."
    Sequel.sqlite('database_test.sqlite3')
  end

  def production_connection
    puts "Setting up the PRODUCTION environment database."
    Sequel.sqlite('production.sqlite3')
  end

  def define_dataset(type)
    @dataset = connection.from(type)
  end

  def create(type, attributes)
    define_dataset(type)
    dataset.insert(attributes)
  end

  def find(type,attribute)
    define_dataset(type)
    dataset.select(attribute)
  end

  def update(type, id, value)
    define_dataset(type)
    dataset.where(:id => id).update(attribute => value)
  end

  def delete(type, attribute)
    define_dataset(type)
    dataset.where(:id => id).delete
  end
end
