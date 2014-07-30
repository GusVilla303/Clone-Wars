class SocialLove
  attr_reader :title, :header, :body

  def initiailize(attribute)
    @title  = attribute["title"]
    @header = attribute["header"]
    @body   = attribute["body"]
  end
end
