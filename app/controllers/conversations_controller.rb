class ConversationsController < ApplicationController

	before_filter :authenticate_user!

	def index
		@conversations = current_user.mailbox.conversations
	end

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
	end
	
end
