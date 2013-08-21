class CLCity
  
  attr_accessor :name, :url
  
  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:url]
  end
  
  def rss_url
    self.url + '/rid/index.rss'
  end
end