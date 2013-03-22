class Subscription < ActiveRecord::Base
  attr_accessible :email
  # format check for email based on http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
  validates :email,
            :presence => true,
            :uniqueness => true,
            :format => { :with => /.+@.+\..+/i, :message => "Please enter a valid email address" }
end
