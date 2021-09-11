class RoomMessage < ApplicationRecord
	include Rails.application.routes.url_helpers

	belongs_to :user
	belongs_to :room
	has_one_attached :image
	belongs_to :reply_to, class_name: 'RoomMessage', foreign_key: :reply_to_id, optional: true

	def as_json(options)
	    super(options).merge(
			user_avatar: "https://ui-avatars.com/api/?name=#{user.username}&background=0A2131&rounded=true&color=fff", 
			author_and_timestamp: "#{user.username} - #{time_to_string(created_at)}",
			image_url: image.attached? ? rails_blob_path(image, only_path: true) : '',
			reply_to_username: reply_to ? reply_to.user.username.titleize : '',
			reply_to_content: reply_to ? reply_to.content : ''
		)
	end

	def time_to_string data
		data.nil? ? '?' : data.strftime("%H:%M")
	end
end
