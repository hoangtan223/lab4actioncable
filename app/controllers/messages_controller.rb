class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def create
		@message = Message.new message_param
		@message.ip = request.remote_ip
		if @message.save 
			redirect_to root_path
		else
			flash[:error] = "Cannot send message"
			render 'index'
		end
	end

	private 
	def message_param
		params.require(:message).permit(:content, :ip)
	end
end
