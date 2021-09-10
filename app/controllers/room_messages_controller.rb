class RoomMessagesController < ApplicationController
	before_action :login_required

	def create
		@room_message = RoomMessage.new room_message_params
		@room_message.user_id = @current_user.id

		if @room_message.save
			RoomChannel.broadcast_to @room_message.room, @room_message 
		else
			puts @room_message.errors.full_messages.join(", ")
		end
	end


	private
		def room_message_params
			params.require(:room_message).permit(:content, :room_id, :image)
		end
end
