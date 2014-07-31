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
    @connection.run "CREATE TABLE IF NOT EXISTS page  (
      id integer primary key autoincrement,
      header varchar(50),
      title varchar(50),
      main_body varchar(2000),
      sub_heading varchar,
      sub_body varchar(2000),
      image_description1 varchar,
      image_description2 varchar,
      image_description3 varchar)"

    @connection.run "CREATE TABLE IF NOT EXISTS locations  (
      id integer primary key autoincrement,
      header varchar(50),
      title varchar(50),
      hours varchar(200),
      main_body varchar(2000),
      sub_heading varchar(50),
      sub_body varchar(2000),
      address varchar(50))"

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
    if @connection[:locations].to_a.empty?
      @connection[:locations].insert(
        :title       => "Denver, CO - Backcountry Delicatessen",
        :header      => "Denver, CO",
        :hours       => "Open Mon – Fri 7 am – 6 pm, Sat – Sun 8 am – 6 pm | 303-534-7900",
        :main_body   => "Even the most daring adventurers need a little civilization. Established in 2010, Backcountry Delicatessen Denver combines a little mountain spirit with the upbeat energy of “LoDo” (on the 16th Street pedestrian mall just four blocks from Coors Field). So make our Denver Deli your choice before or after all your adventures in downtown Denver. BCD Denver is owned and operated by Dave Mischell, a civilized adventurer if we ever saw one.",
        :sub_heading => "Denver community involvement",
        :sub_body    => "BCD Denver is a member of the Downtown Denver Partnership and also sponsors several charities including the Hitachi Consulting Tour de Cure Cycling Team benefiting the American Diabetes Association. Owner-Operator Dave Mischell is on the Board of Directors for LoDo District Inc. and Co-Chair of its Economic & Community Development Committee.",
        :address     => "LoDo 1617 Wazee St Denver, CO 80202"
      )
      @connection[:locations].insert(
        :title       => "Fort Collins, CO - Backcountry Delicatessen",
        :header      => "Fort Collins, CO",
        :hours       => "Open Mon – Sun 7 am – 5 pm | 970-482-6913",
        :main_body   => "Our first front range location and what a lively one it is. Since 2007 Backcountry Delicatessen Fort Collins has enjoyed being a part of and catering to a local mix of active lifestyles and hungry appetites. BCD Fort Collins is located in the heart of the Historic Old Town District, and boasts a recently redesigned and inviting interior. Stop in and see what’s cooking, both behind the counter and with bikers, hikers, skiers, and adventurers of every kind.",
        :sub_heading => "Fort Collins community involvement:",
        :sub_body    => "Ciclismo Youth Foundation, FC Bikes, CSU Cycling team, FC Bike Library, First City Cycling team, Overland Mountain Bike Club",
        :address     => "Old Town 140 N College Ave Fort Collins, CO 80524"
      )
      @connection[:locations].insert(
        :title       => "Jackson Hole, WY - Backcountry Delicatessen",
        :header      => "Jackson Hole, WY",
        :hours       => "Open Mon – Sun 7 am – 5 pm | 307-734-9420",
        :main_body   => "It’s no coincidence that one of our favorite playgrounds was chosen to be our first expansion. Opened in 2005, Backcountry Delicatessen Jackson Hole is located in the heart of Town Square. BCD Jackson embraces the beauty of the Tetons and Yellowstone National Park with memorabilia and breath-taking photography. In this land of high octane adventure, we’re proud Backcountry has become a favorite go-to for locals and seasonal tourists alike in search of great tasting fuel.",
        :sub_heading => "Jackson Hole community involvement:",
        :sub_body    => "Teton Freedom Riders, Friends of the Pathways, JH Ski Club",
        :address     => "Town Square 50 W Deloney Ave, Jackson Hole, WY"
      )
      @connection[:locations].insert(
        :title       => "Steamboat Springs, CO - Backcountry Delicatessen",
        :header      => "Steamboat Springs, CO",
        :hours       => "Open Mon – Sun 7 am – 5 pm | 970-879-3617",
        :main_body   => "This is where it all started, our flagship deli. Since 1999 (boy does time fly) we’ve had the privilege to serve the great adventurers and people of Steamboat – locals and visitors alike. Located in the heart of downtown, BCD Steamboat offers the healthiest and tastiest food around in a down-to-earth, hometown atmosphere. Dine inside, on our large sun-kissed patio, or take it to go wrapped specially for your adventures.",
        :sub_heading => "Steamboat Springs community involvement:",
        :sub_body    => "SSWSC, Yampa River Foundation, Steamboat Arts Council, Routt County Riders, STARS, Town Challenge Series, Routt County Search and Rescue, Steamboat Velo, Safe Routes to School, Routt County Friends of the Backcountry, Bike Town USA initiative.",
        :address     => "Old Town Square 635 Lincoln Ave, Steamboat Springs, CO"
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


  def update(table, id, attribute, value)
    @connection[table].where(:id => id).update(attribute => value)
  end

  def delete(attribute)
    define_dataset
    dataset.where(:id => id).delete
  end
end
