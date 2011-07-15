class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.string :email
      t.string :status
      t.string :shared_key
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
