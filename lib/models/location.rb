class Location
  attr_reader :name,
              :city,
              :state,
              :address,
              :phone_number,
              :hours,
              :daily_special,
              :header,
              :title,
              :community_header,
              :community_body,
              :body
  def initialize(attributes)
    @name             = attributes["name"]
    @city             = attributes["city"]
    @state            = attributes["state"]
    @address          = attributes["address"]
    @phone_number     = attributes["phone_number"]
    @hours            = attributes["hours"]
    @daily_special    = attributes["daily_special"]
    @header           = attributes["header"]
    @title            = attributes["title"]
    @body             = attributes["body"]
    @community_header = attributes["community_header"]
    @community_body   = attributes["community_body"]
  end
end
