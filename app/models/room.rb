class Room < ApplicationRecord
	has_many :messages, dependent: :destroy, class_name: 'RoomMessage'
end
