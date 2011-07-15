class ProfilesFriends < ActiveRecord::Migration
  def self.up
    create_table :profiles_friends, :id => false do |t|
      t.references :profile
      t.references :friend
    end
  end

  def self.down
    drop_table :profiles_friends
  end
end
