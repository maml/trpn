require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  def test_launch_notification_email
    subscription = subscriptions(:one)
 
    # Send the email, then test that it got queued
    email = SubscriptionMailer.launch_notification_email(subscription).deliver
    assert !ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal [subscription.email], email.to
  end
end
