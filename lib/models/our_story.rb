class OurStory
  attr_reader :title,
              :header,
              :body,
              :image_description,
              :new_name_header,
              :new_name_body
  def initialize(attributes)
    @title             = attributes["title"]
    @header            = attributes["header"]
    @body              = attributes["body"]
    @image_description = attributes["image_description"]
    @new_name_header   = attributes["new_name_header"]
    @new_name_body     = attributes["new_name_body"]

  end
end
