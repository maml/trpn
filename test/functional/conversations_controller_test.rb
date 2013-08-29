require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase

	setup do
		login_user  # users(:two)
	end

	test "should get index" do
		get :index
		assert_response :success
		assert_not_nil assigns(:conversations)
	end

	test "should show conversation" do
		sender = users(:two)
		receiver = users(:one)
		sender.send_message(receiver, "body of message", "subject line")
		conversation = sender.mailbox.conversations[0]
		get :show, id: conversation
		assert_response :success
		assert_not_nil assigns(:conversation)
	end

end
