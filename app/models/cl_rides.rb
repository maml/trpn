require 'nokogiri'

class CLRides
  attr_accessor :city
  
  def initialize(attributes)
    @city = attributes[:city]
    @rides = []
    doc = Nokogiri::XML(open(@city.rss_url))
    doc.css('item').map do |i|
      title = i.css('title').inner_text
      link = i.css('link').inner_text
      description = i.css('description').inner_text
      @rides.push CLRide.new(:title => title, :link => link, :description => description)
    end
  end
  
  def each(&block)
    @rides.each &block
  end
end