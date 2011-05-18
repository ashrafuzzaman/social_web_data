class CreateProfileAttributes < ActiveRecord::Migration
  def self.up
    create_table :profile_attributes do |t|
      t.string :name
      t.string :value
      t.string :type
      t.boolean :active, :default => true
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_attributes
  end
end
