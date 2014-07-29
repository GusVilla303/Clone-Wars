class Menu
  attr_reader :title,
              :header,
              :menu_items,
              :menu_id,
              :item_type

  def initialize(attributes)
    @name             = attributes["title"]
    @city             = attributes["header"]
    @state            = attributes["menu_id"]
    @address          = attributes["item_type"]
  end
end
