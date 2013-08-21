class ImportController < ApplicationController
  
  def index
    @cities = []
    cities = YAML.load(File.read('config/cl_cities.yml'))
    cities.each do |name, url| 
      @cities.push(CLCity.new(:name => name, :url => url))
    end
    
    if params[:city]
      city = @cities.detect{|c| c.name == params[:city] }
      if city
        @rides = CLRides.new(:city => city)
      end
    end
  end
end
