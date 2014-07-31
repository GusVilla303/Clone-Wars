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
      @connection[:page].insert(
        :header             => "Our Story",
        :title              => "Our Story - Backcountry Delicatessen",
        :main_body          => "Take two fun-loving, yet seriously dedicated guys. Add passion for adventure in the great outdoors, and an equal amount of passion for natural, nutritious, great tasting food that can fuel their lifestyle. Throw in a heavy dose of community involvement. What do you get? Backcountry Delicatessen.That’s the recipe that Peter Boniface and David Pepin used to start it all in 1999 in downtown Steamboat Springs. Today, Backcountry Delicatessens are enjoyed in three additional vibrant and active communities — Jackson Hole, Fort Collins, and Denver. In every Backcountry Deli you visit, you’ll find the same commitment to Peter’s and David’s beginning principles — always natural and fresh ingredients, always the best fare they can make, always the best service they can provide. There’s more to the story of course. But all you need to know is Backcountry is the place to satisfy your hunger for great food and fuel your active life.",
        :sub_heading        => "New Name. Old Name. Same Commitment",
        :sub_body           => "Why? Because when we first opened, virtually every outdoor expedition in the Steamboat Springs region — whether skiing, cycling, rafting, or climbing — made sure to pack into their essential provisions the one thing that made a successful day of adventure certain. Backcountry Provisions fare! Today, we’re pleased to unveil a new name and look to better embody our continued commitment to you and adventurers of every kind.",
        :image_description1 => "Backcountry Delicatessen was originally called Backcountry Provisions.",
        :image_description2 => "Dave and Pete opening the Steamboat Springs Deli - circa 1999",
        :image_description3 => "The boys today kicking back"
        )
      @connection[:page].insert(
        :header             => "Social Love",
        :title              => "Social Love - Backcountry Delicatessen",
        :main_body          => "We primarily communicate our daily specials, community group highlights, and outdoor adventures through our social media channels. We have Facebook and Twitter pages for all our Backcountry Deli stores. Check out all the latest on our social wall below – and please friend/follow us. We'd friend/follow you anywhere"
        )
      @connection[:page].insert(
        :header             => "Franchise Info",
        :title              => "Franchise Info - Backcountry Delicatessen",
        :main_body          => "Backcountry Delicatessen’s plan of growth is to choose select locations that connect with our unique brand and philosophy. Think your community could be a good fit for a Backcountry Delicatessen? Well, we’re interested in talking with you.\n\nBefore we do, here’s a few of our company’s primary values:",
        :sub_body           => "Providing a fresh concept with unique and great tasting fare\nSourcing the highest quality/ freshest ingredients\nSupporting franchisees around the clock\nPromoting an active and healthy lifestyle-culture\nBringing the mountain lifestyle to your neighborhood\nCreating strong community presence-involvement-commitment\nBringing value to community business infrastructure\nBeing passionate about who and what we are\nBringing strong brand loyalty/following\nRewarding cost structure",
        :image_description1 => "Contact us by clicking the button in the right sidebar to fill out a Franchise Inquiry form.",
        :image_description2 => "Let’s start the conversation.",
        :image_description3 => "Collecting another annual haul at the Best of the Boat awards - Steamboat Springs"
      )
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
