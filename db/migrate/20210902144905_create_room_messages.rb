class CreateRoomMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :room_messages do |t|
      t.integer :room_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
