class AddReplyToIdToRoomMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :room_messages, :reply_to_id, :integer, :null => true 
  end
end
