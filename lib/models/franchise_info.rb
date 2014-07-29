class FranchiseInfo
  attr_reader :title,
              :header,
              :description,
              :sub_description,
              :unordered_list,
              :inquiry_line,
              :start_convo
  def initialize(attributes)
    @title           = attributes["title"]
    @header          = attributes["header"]
    @description     = attributes["description"]
    @sub_description = attributes["sub_description"]
    @unordered_list  = attributes["unordered_list"]
    @inquiry_line    = attributes["inquiry_line"]
    @start_convo     = attributes ["start_convo"]
  end
end
