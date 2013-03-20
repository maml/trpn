class SplashController < ApplicationController
  def index
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subscription }
    end
  end
end
