class ConversationsController < ApplicationController

	before_filter :authorize

	def index
		@conversations = current_user.mailbox.conversations
	end

	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
		@messages = @conversation.messages.order("created_at ASC")
	end

	def reply
		@conversation = current_user.mailbox.conversations.find(params[:id])
	  current_user.reply_to_conversation(@conversation, params[:body])
    redirect_to @conversation
	end
	
end
