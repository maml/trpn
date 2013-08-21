class CLRide
  
  attr_accessor :title, :description, :link
  
  def initialize(attributes)
    @title = attributes[:title]
    @description = attributes[:description]
    @link = attributes[:link]
  end
  
end