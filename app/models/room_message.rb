class RoomMessage < ApplicationRecord
	belongs_to :user
	belongs_to :room

	def as_json(options)
	    super(options).merge(user_avatar: "https://ui-avatars.com/api/?name=#{user.username}&background=0A2131&rounded=true&color=fff", author_and_timestamp: "#{user.username} - #{time_to_string(created_at)}")
	end

	def time_to_string data
		data.nil? ? '?' : data.strftime("%H:%M")
	end
end
