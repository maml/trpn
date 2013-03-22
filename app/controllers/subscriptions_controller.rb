class SubscriptionsController < ApplicationController
  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if @subscription.save
				SubscriptionMailer.launch_notification_email(@subscription).deliver
				format.html { redirect_to root_path, notice: "Thanks for signing up! We'll let you know when the app is available." }
        format.json { render json: @subscription, status: :created, location: @subscription }
      else
        format.html { render "splash/index" }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end
end
