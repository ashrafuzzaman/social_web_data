class AddDataStoreToFriend < ActiveRecord::Migration
  def self.up
    change_table :friends do |t|
      t.string :data_store
    end

  end

  def self.down
    change_table :friends do |t|
      t.remove :data_store
    end
  end
end
