require 'sequel'
require 'nokogiri'

class Database
  attr_reader :connection
  Database.extension :pg_array

  def initialize
    if ENV['RUBY_ENV'] == "test"
      test_connection
    else
      production_connection
    end
  end

  def test_connection
    puts "Setting up the TEST environment database."
    Sequel.sqlite('database_test.sqlite3')
  end

  def production_connection
    puts "Setting up the PRODUCTION environment database."
    @connection = Sequel.sqlite('production.sqlite3')
    @connection.run "CREATE TABLE page (id integer primary key autoincrement,
                                         header varchar(50),
                                         title varchar(50),
                                         main_body varchar(2000),
                                         sub_heading varchar,
                                         sub_body varchar(2000),
                                         image_description1 varchar,
                                         image_description2 varchar,
                                         image_description3 varchar,
                                         hours varchar,
                                         phone_number varchar,
                                         address varchar,
                                         daily specials varchar,
                                         food_column integer,
                                         food_type varchar,
                                         food_title varchar,
                                         price varchar,
                                         toasted varchar(5)
                                         food_desrciption varchar)"
                                         
  end

  def define_dataset
    @dataset = connection.from(:page)
  end

  def create(attributes)
    define_dataset
    dataset.insert(attributes)
  end

  def find(attribute)
    define_dataset(type)
    dataset.select(attribute)
  end

  def update(id, value)
    define_dataset(type)
    dataset.where(:id => id).update(attribute => value)
  end

  def delete(attribute)
    define_dataset(type)
    dataset.where(:id => id).delete
  end
end
