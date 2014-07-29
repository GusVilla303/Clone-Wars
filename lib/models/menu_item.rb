class Menu
  attr_reader :title,
              :price,
              :toasted,
              :description,
              :menu_id

  def initialize(attributes)
    @name             = attributes["title"]
    @city             = attributes["price"]
    @state            = attributes["toasted"]
    @address          = attributes["menu_id"]
  end
end
