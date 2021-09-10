class RoomMessage < ApplicationRecord
	include Rails.application.routes.url_helpers

	belongs_to :user
	belongs_to :room
	has_one_attached :image

	def as_json(options)
	    super(options).merge(
			user_avatar: "https://ui-avatars.com/api/?name=#{user.username}&background=0A2131&rounded=true&color=fff", 
			author_and_timestamp: "#{user.username} - #{time_to_string(created_at)}",
			image_url: image.attached? ? rails_blob_path(image, only_path: true) : ''
		)
	end

	def time_to_string data
		data.nil? ? '?' : data.strftime("%H:%M")
	end
end
