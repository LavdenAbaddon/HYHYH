class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :admin_1
      t.integer :admin_2
      t.integer :host_id
      t.string :room_name, limit: 40

      t.timestamps
    end
  end
end
