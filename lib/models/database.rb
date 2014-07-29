require 'sequel'

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

  def connection_type(type, attribute)
    @connection = connection.from(type)
  end

  def create(type, attribute)
    connection_type
    connection.insert(attribute)
  end

  def find(type, attribute)
    connection_type
    connection.select(attribute)
  end

  def update(type, attribute)
    connection_type
    connection.update(attribute)
  end

  def delete(type, attribute)
    connection_type
    connection.delete(attribute)
  end
end
