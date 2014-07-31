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

    @connection.run "CREATE TABLE IF NOT EXISTS items  (
      id integer primary key autoincrement,
      menu_id integer,
      menu_heading_id integer,
      title varchar(50),
      price varchar,
      description varchar(50),
      toasted varchar(5))"

    @connection.run "CREATE TABLE IF NOT EXISTS menus (
      id integer primary key autoincrement,
      title varchar(50))"

    @connection.run "CREATE TABLE IF NOT EXISTS menu_headings (
      id integer primary key autoincrement,
      title varchar(50),
      menu_id)"

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
    if @connection[:items].to_a.empty?
      @connection[:items].insert(
        :menu_id          => "1",
        :menu_heading_id  => "",
        :title            => "Egg, Ham and Cheddar",
        :price            => "4.50",
        :description      => "fresh egg, smoked ham, melted sharp cheddar, served on a toasted ciabatta"
      )
      @connection[:items].insert(
        :menu_id          => "1",
        :menu_heading_id  => "",
        :title            => "Egg, Bacon and Cheddar",
        :price            => "4.50",
        :description      => "fresh egg, maple cured bacon, melted sharp cheddar, served on a toasted ciabatta"
      )
     @connection[:items].insert(
      :menu_id          => "1",
      :menu_heading_id  => "",
      :title            => "Egg, Sausage and Cheddar",
      :price            => "4.50",
      :description      => "fresh egg, chicken apple sausage link, melted sharp cheddar, served on a toasted ciabatta"
    )
    @connection[:items].insert(
     :menu_id          => "1",
     :menu_heading_id  => "",
     :title            => "Veggie",
     :price            => "4.50",
     :description      => "fresh egg, avocado, tomato, melted sharp cheddar, served on a toasted ciabatta"
    )
   @connection[:items].insert(
    :menu_id          => "1",
    :menu_heading_id  => "",
    :title            => "EBLT",
    :price            => "5.00",
    :description      => "fresh egg, maple cured bacon, melted sharp cheddar, lettuce, tomato, chipotle mayo, served on a toasted ciabatta"
   )
   @connection[:items].insert(
    :menu_id          => "1",
    :menu_heading_id  => "",
    :title            => "Little Italy",
    :price            => "5.00",
    :description      => "fresh egg, imported capocollo, melted sharp provolone, hot cherry peppers, basil pesto, served on a toasted ciabatta"
   )
   @connection[:items].insert(
    :menu_id          => "1",
    :menu_heading_id  => "",
    :title            => "Ranchero",
    :price            => "5.00",
    :description      => "fresh egg, chorizo sausage, roasted green chiles, fresh sliced avocado, melted pepperjack, served on a toasted ciabatta"
   )
   @connection[:items].insert(
    :menu_id          => "1",
    :menu_heading_id  => "",
    :title            => "Lox",
    :price            => "8.95",
    :description      => "thinly sliced atlantic smoked salmon, cream cheese, tomato, onion, capers, served on a toasted ciabatta"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "1",
    :title            => "Pilgrim",
    :price            => "9.25",
    :description      => "roasted turkey, muenster, seasoned stuffing, cranberry chutney, romaine lettuce, mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "1",
    :title            => "Ridgeline",
    :price            => "9.25",
    :description      => "roasted turkey, sharp cheddar, honey cured bacon, avocado, tomato, romaine lettuce, garlic mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "1",
    :title            => "Bushwacker",
    :price            => "8.95",
    :description      => "curry chicken salad with toasted almonds & granny smith apples, smoked gouda, romaine lettuce",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "1",
    :title            => "County Road",
    :price            => "8.95",
    :description      => "sliced chicken breast, fontina, oven roasted tomatoes, red onion, field greens, pesto mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "1",
    :title            => "Turkey Trailhead",
    :price            => "8.95",
    :description      => "roasted turkey, swiss, avocado, tomato, red onion, romaine lettuce, honey dijon mustard",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "2",
    :title            => "Backcountry Cuban",
    :price            => "8.95",
    :description      => "smoked ham, slow roasted pulled pork, jarlsburg, chopped pickles, hot cherry peppers, mayo, yellow mustard",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "2",
    :title            => "Summit",
    :price            => "9.25",
    :description      => "smoked ham, french brie, honey cured bacon, cranberry chutney, romaine lettuce, chipotle mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "2",
    :title            => "Ham Trailhead",
    :price            => "8.95",
    :description      => "smoked ham, swiss, avocado, tomato, red onion, romaine lettuce, honey dijon mustard",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "3",
    :title            => "Hot Springs",
    :price            => "8.75",
    :description      => "avocado, tomato, red onion, cucumber, carrots, sprouts, field greens, cream cheese, house vinaigrette",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "3",
    :title            => "Sherpa",
    :price            => "8.95",
    :description      => "grilled eggplant, asiago, sweet roasted red peppers, tomato, romaine lettuce, garlic mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "3",
    :title            => "High Plains",
    :price            => "8.75",
    :description      => "fresh mozzarella, tomato, romaine lettuce, basil pesto",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "3",
    :title            => "Hidden Valley",
    :price            => "8.75",
    :description      => "artichoke hearts, chevre, oven roasted tomatoes, field greens, balsamic vinaigrette",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "4",
    :title            => "Expedition",
    :price            => "9.25",
    :description      => "top round roast beef, sharp cheddar, tomato, avocado, romaine lettuce, chipotle mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "4",
    :title            => "Avalanche",
    :price            => "8.95",
    :description      => "top round roast beef, asiago, tomato, romaine lettuce, house vinaigrette",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "4",
    :title            => "Fourteener",
    :price            => "8.95",
    :description      => "top round roast beef, crumbled blue cheese, sweet roasted red peppers, romaine lettuce, horseradish mayo",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "4",
    :title            => "Pinnacle",
    :price            => "9.25",
    :description      => "lean pastrami, swiss, fresh coleslaw, served with a side of house russian dressing",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "4",
    :title            => "Emerald",
    :price            => "8.95",
    :description      => "lean corned beef, swiss, red onion, romaine lettuce, deli brown mustard",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "5",
    :title            => "Godfather",
    :price            => "8.95",
    :description      => "mortadella, capocollo, sharp provolone, tomato, red onion, romaine lettuce, house vinaigrette",
    :toasted          => "yes",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "5",
    :title            => "Dolomite",
    :price            => "8.95",
    :description      => "prosciutto, genoa salami, sharp provolone, sweet roasted red peppers, red onion, romaine lettuce, house vinaigrette",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "5",
    :title            => "The Grand",
    :price            => "9.75",
    :description      => "prosciutto, capocollo, sopressata, sharp provolone, tomato, romaine lettuce, garlic mayo, house vinaigrette",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "5",
    :title            => "Base Camp",
    :price            => "8.95",
    :description      => "german bologna, jarlsburg, tomato, red onion, romaine lettuce, garlic mayo",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "5",
    :title            => "Braunschweiger",
    :price            => "8.95",
    :description      => "german liverwurst, swiss, red onion, romaine lettuce, dijon mustard",
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "7",
    :title            => "Lost Creek",
    :price            => "9.25",
    :description      => "all white albacore tuna salad, swiss, avocado, tomato, field greens",
    :toasted          => "yes"
   )
   @connection[:items].insert(
    :menu_id          => "2",
    :menu_heading_id  => "7",
    :title            => "Angler",
    :price            => "9.75",
    :description      => "cold smoked atlantic salmon, dill havarti, sprouts, cucumber, capers, tomato, red onion, field greens, honey dijon mustard",
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "French Baguette"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "Whole Wheat"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "Sour Dough"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "Light Rye"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "Wrap"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "7",
    :title            => "Whole Grain Gluten Free | + .50"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Roasted Turkey"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Roast Beef"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Smoked Ham"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Corned Beef"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Pulled Pork"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Sliced Chicken Breast"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Prosciutto"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Genoa Salami"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Sopressata"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Mortadella"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Capocollo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "German Bologna"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Braunschweiger"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Tuna Salad"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Curry Chicken Salad"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Smoked Salmon | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Pastrami | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Bacon | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "8",
    :title            => "Extra Meat | + 2.50"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Swiss"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Provologne"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Cheddar"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Muenster"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "French Brie"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Smoked Gouda"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Fortina"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Chevre"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Fresh Mozarella"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Asiago"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Pepperjack"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Crumbled Blue"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Feta"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Dill Harvarti"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Jarlsburg"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "American"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Cream Cheese"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "9",
    :title            => "Extra cheese | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Romain Lettuce"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Field Greens"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Tomato"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Red Onion"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Cucumber"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Carrot"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Sprouts"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Pickles"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Pepperoncini"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Kalamata Olives"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Giardiniera"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Coleslaw"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Hot Cherry Peppers"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Avacodo | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Artichoke Hearts | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Grilled Eggplant | + 1.00"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Roasted Red Peppers | + .50"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "10",
    :title            => "Oven Roasted Tomatoes | + .50"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Mayo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Chipotle Mayo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Horseradish Mayo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Garlic Mayo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Pesto Mayo"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Dijon Mustard"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Deli Brown Mustard"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Honey Dijon Mustard"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Yellow Mustard"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "House Caesar Dressing"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "House Russian Dressing"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "House Vinaigrette"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "House Balsamic Vinaigrette"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "House Buttermilk Ranch"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Basil Pesto | + .50"
   )
   @connection[:items].insert(
    :menu_id          => "3",
    :menu_heading_id  => "11",
    :title            => "Cranberry Chutney | + .50 "
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "12",
    :title            => "Greek Salad",
    :price            => "8.50",
    :description      => "cucumber, pepperoncini, kalamata olives, red onion, grape tomatoes, feta, served on a bed of field greens with our house balsamic vinaigrette.   Add Salami | + 2.00 "
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "12",
    :title            => "Chicken Caesar",
    :price            => "9.25",
    :description      => "sliced chicken breast served on a bed of crisp romaine lettuce, fresh croutons & shaved asiago cheese with our house caesar dressing"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "12",
    :title            => "Cobb Salad",
    :price            => "10.25",
    :description      => "fresh cubed chicken breast, bacon, avocado, chopped hard-boiled egg, grape tomatoes, red onion, crumbled blue cheese, served on a bed of field greens with our house buttermilk ranch dressing"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "13",
    :title            => "Soup - Cup",
    :price            => "3.50",
    :description      => "fresh soups prepared daily"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "13",
    :title            => "Soup - Bowl",
    :price            => "5.50",
    :description      => "fresh soups prepared daily"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "14",
    :title            => "Deli Salads - Small",
    :price            => "2.50",
    :description      => "potato salad & coleslaw made fresh daily, half-pint"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "14",
    :title            => "Deli Salads - Large",
    :price            => "4.00",
    :description      => "potato salad & coleslaw made fresh daily, pint"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "14",
    :title            => "Potato Chips",
    :price            => "1.30",
    :description      => "sea salt, salt & vinegar, barbeque, jalapeno, Sun Chips"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "14",
    :title            => "Desserts",
    :price            => "1.75 each",
    :description      => "Freshly baked chocolate chip cookies, oatmeal raisin cookies, and fudge brownies"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Fountain Drinks",
    :price            => "2.50",
    :description      => "Pepsi, Diet Pepsi, Dr Pepper, Diet Dr Pepper, Mountain Dew, Diet Mountain Dew"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Izze",
    :price            => "2.50",
    :description      => "Blackberry, Grapefruit, Pomegranate, Clementine"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "San Pellegrino",
    :price            => "2.50",
    :description      => "Limonata, Aranciata, Blood Orange, Sparkling (500 ml + .50)"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Arizona Iced Tea",
    :price            => "3.00",
    :description      => "24 oz"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Bottled Water",
    :price            => "2.00",
    :description      => ""
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Fresh Brewed Iced Tea",
    :price            => "1.50",
    :description      => ""
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Backcountry Bold Coffee - Small",
    :price            => "1.50",
    :description      => "we proudly serve our custom, Colorado roasted Backcountry Bold coffee"
   )
   @connection[:items].insert(
    :menu_id          => "4",
    :menu_heading_id  => "15",
    :title            => "Backcountry Bold Coffee - Large",
    :price            => "2.50",
    :description      => "we proudly serve our custom, Colorado roasted Backcountry Bold coffee"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "16",
    :title            => "Breakfast Sandwich Tray",
    :price            => "30.00",
    :description      => "2 bacon, 2 ham & 2 veggie hot egg sandwiches",
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "16",
    :title            => "Classic Sandwich Tray",
    :price            => "62.95",
    :description      => "classic deli sandwiches; includes turkey, ham, roast beef, corned beef, prepared with choice cheeses, lettuce & tomato"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "16",
    :title            => "Custom Sandwich Tray",
    :price            => "72.95",
    :description      => "create your own custom tray from our specialty sandwich menu; choose 6 sandwiches"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "16",
    :title            => "Signature Sandwich Tray",
    :price            => "69.95",
    :description      => "make it easy, let us choose our most popular choices"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "17",
    :title            => "Panzanella",
    :price            => "45.00",
    :description      => "artichoke hearts, grape tomatoes, capers, chevre, fresh croutons, served on a bed of field greens with our house balsamic vinaigrette."
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "17",
    :title            => "Greek Salad",
    :price            => "49.00",
    :description      => "cucumber, pepperoncini, kalamata olives, red onion, grape tomatoes, feta, served on a bed of field greens with our house balsamic vinaigrette."
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "17",
    :title            => "Chicken Caesar",
    :price            => "49.00",
    :description      => "sliced chicken breast served on a bed of crisp romaine lettuce, fresh croutons & shaved asiago cheese with our house caesar dressing"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "17",
    :title            => "Cobb Salad",
    :price            => "53.00",
    :description      => "fresh cubed chicken breast, bacon, avocado, chopped hard-boiled egg, grape tomatoes, red onion, crumbled blue cheese, served on a bed of field greens with our house buttermilk ranch dressing"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "17",
    :title            => "Garden Salad",
    :price            => "39.00",
    :description      => "cucumbers, carrots, grape tomatoes, and red onion served over a bed of field greens, served with a side of balsamic and ranch dressing"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "18",
    :title            => "Soup & Salad Box Lunch",
    :price            => "10.95",
    :description      => "cup of fresh made soup, choice of half salad & fresh baked dessert"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "18",
    :title            => "Soup & Sandwich Box Lunch",
    :price            => "10.95",
    :description      => "cup of fresh made soup, choice of half sandwich, chips & fresh baked dessert"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "18",
    :title            => "Salad Box Lunch",
    :price            => "10.95",
    :description      => "your choice of greek, cobb, chicken caesar, panzanella, or garden salad; includes french baguette & fresh baked dessert or apple"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "18",
    :title            => "Day Hiker Box Lunch",
    :price            => "10.25",
    :description      => "a classic deli sandwich on french bread, choice of ham, turkey, roast beef, or veggie, with lettuce, tomato, onion, cheddar cheese, mustard & mayonnaise on side; includes pickle spear, chips, & fresh baked dessert"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "18",
    :title            => "Backpacker Box Lunch",
    :price            => "10.95",
    :description      => "a sandwich of your choice from our specialty sandwich menu; includes pickle spear, chips & fresh baked dessert"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "19",
    :title            => "Deli Salads - Small",
    :price            => "2.50",
    :description      => "potato salad & coleslaw made fresh daily, half-pint"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "19",
    :title            => "Deli Salads - Large",
    :price            => "5.00",
    :description      => "potato salad & coleslaw made fresh daily, pint"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "19",
    :title            => "Potato Chips",
    :price            => "1.30",
    :description      => "sea salt, salt & vinegar, barbeque, jalapeno, Sun Chips "
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "19",
    :title            => "Desserts",
    :price            => "1.75 each",
    :description      => "Freshly baked chocolate chip cookies, oatmeal raisin cookies, and fudge brownies"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "Fountain Drinks",
    :price            => "2.50",
    :description      => "Pepsi, Diet Pepsi, Dr Pepper, Diet Dr Pepper, Mountain Dew, Diet Mountain Dew"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "Izze",
    :price            => "2.50",
    :description      => "Blackberry, Grapefruit, Pomegranate, Clementine"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "San Pellegrino",
    :price            => "2.50",
    :description      => "Limonata, Aranciata, Blood Orange, Sparkling (500 ml + .50)"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "Arizona Iced Tea",
    :price            => "3.00",
    :description      => "24 oz"
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "Bottled Water",
    :price            => "2.00",
    :description      => ""
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "Fresh Brewed Iced Tea",
    :price            => "1.50",
    :description      => ""
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "100 oz Iced Tea Carrier",
    :price            => "15.00",
    :description      => ""
   )
   @connection[:items].insert(
    :menu_id          => "5",
    :menu_heading_id  => "20",
    :title            => "100 oz Coffee Carrier",
    :price            => "15.00",
    :description      => "we proudly serve our custom, Colorado roasted Backcountry Bold coffee"
   )
    end
    if @connection[:menus].to_a.empty?
      @connection[:menus].insert(
      :title => "Hot Breakfast Sandwiches"
      )
      @connection[:menus].insert(
      :title => "Specialty Sandwiches"
      )
      @connection[:menus].insert(
      :title => "Build Your Own Sandwich"
      )
      @connection[:menus].insert(
      :title => "Salads, Soups, Sides, Drinks"
      )
      @connection[:menus].insert(
      :title => "Catering Menu"
      )
    end
    if @connection[:menu_headings].to_a.empty?
      @connection[:menu_headings].insert(
      :title    => "Turkey and Chicken",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "Ham",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "Veggie",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "Beef",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "European",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "Fish",
      :menu_id => "2"
      )
      @connection[:menu_headings].insert(
      :title    => "Bread:",
      :menu_id => "3"
      )
      @connection[:menu_headings].insert(
      :title    => "Meat: (Choose One)",
      :menu_id => "3"
      )
      @connection[:menu_headings].insert(
      :title    => "Cheese: (Choose One)",
      :menu_id => "3"
      )
      @connection[:menu_headings].insert(
      :title    => "Veggies: (All you want)",
      :menu_id => "3"
      )
      @connection[:menu_headings].insert(
      :title    => "Spreads",
      :menu_id => "3"
      )
      @connection[:menu_headings].insert(
      :title    => "Salads",
      :menu_id => "4"
      )
      @connection[:menu_headings].insert(
      :title    => "Soups",
      :menu_id => "4"
      )
      @connection[:menu_headings].insert(
      :title    => "Sides",
      :menu_id => "4"
      )
      @connection[:menu_headings].insert(
      :title    => "Drinks",
      :menu_id => "4"
      )
      @connection[:menu_headings].insert(
      :title    => "Sandwich Trays",
      :menu_id => "5"
      )
      @connection[:menu_headings].insert(
      :title    => "Salads for Group",
      :menu_id => "5"
      )
      @connection[:menu_headings].insert(
      :title    => "Box Lunches (each)",
      :menu_id => "5"
      )
      @connection[:menu_headings].insert(
      :title    => "Sides (each)",
      :menu_id => "5"
      )
      @connection[:menu_headings].insert(
      :title    => "Drinks (each)",
      :menu_id => "5"
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
