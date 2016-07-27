class MessagesController < ApplicationController

	def index
		@messages = Message.all
	end

	def create
		@message = Message.new message_param
		@message.ip = request.remote_ip
		@message.save!
		ActionCable.server.broadcast 'messages', message: render_message(@message)
		respond_to do |format|
			format.js
		end
	end

	private 
	def message_param
		params.require(:message).permit(:content, :ip)
	end

	def render_message(message)
    # Your Code Here
    "<div class=\"message\">#{message.ip}: #{message.content}</div>"
  end
end
