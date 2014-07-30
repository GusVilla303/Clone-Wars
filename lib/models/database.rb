require 'sequel'

class Database
  attr_reader :connection, :dataset

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
    @connection ||= @connection.run "CREATE TABLE IF NOT EXISTS page  (id integer primary key autoincrement,
                                         header varchar(50),
                                         title varchar(50),
                                         main_body varchar(2000),
                                         sub_heading varchar,
                                         sub_body varchar(2000),
                                         image_description1 varchar,
                                         image_description2 varchar,
                                         image_description3 varchar)"
    if @connection[:page].to_a.empty?
      @connection[:page].insert(:header             => "Our Story",
                                :title              => "Our Story - Backcountry Deli",
                                :main_body          => "Take two fun-loving, yet seriously dedicated guys. Add passion for adventure in the great outdoors, and an equal amount of passion for natural, nutritious, great tasting food that can fuel their lifestyle. Throw in a heavy dose of community involvement. What do you get? Backcountry Delicatessen.That’s the recipe that Peter Boniface and David Pepin used to start it all in 1999 in downtown Steamboat Springs. Today, Backcountry Delicatessens are enjoyed in three additional vibrant and active communities — Jackson Hole, Fort Collins, and Denver. In every Backcountry Deli you visit, you’ll find the same commitment to Peter’s and David’s beginning principles — always natural and fresh ingredients, always the best fare they can make, always the best service they can provide. There’s more to the story of course. But all you need to know is Backcountry is the place to satisfy your hunger for great food and fuel your active life.",
                                :sub_heading        => "New Name. Old Name. Same Commitment",
                                :sub_body           => "Why? Because when we first opened, virtually every outdoor expedition in the Steamboat Springs region — whether skiing, cycling, rafting, or climbing — made sure to pack into their essential provisions the one thing that made a successful day of adventure certain. Backcountry Provisions fare! Today, we’re pleased to unveil a new name and look to better embody our continued commitment to you and adventurers of every kind.",
                                :image_description1 => "Backcountry Delicatessen was originally called Backcountry Provisions.",
                                :image_description2 => "Dave and Pete opening the Steamboat Springs Deli - circa 1999",
                                :image_description3 => "The boys today kicking back")
    end
  end

  def define_dataset
    @dataset = connection[:page]
  end

  def create(attributes)
    define_dataset
    dataset.insert(attributes)
  end

  def find(id, attribute)
    @connection[:page].where(:id => id).select(attribute)
  end


  def update(id, attribute, value)
    @connection[:page].where(:id => id).update(attribute => value)
  end

  def delete(attribute)
    define_dataset
    dataset.where(:id => id).delete
  end
end
