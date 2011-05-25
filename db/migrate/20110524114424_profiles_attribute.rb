class ProfilesAttribute < ActiveRecord::Migration
  def self.up
    create_table( :profiles_attributes, :id => false) do |t|
      t.references :profile
      t.references :profile_attribute
    end

  end

  def self.down
    drop_table :profiles_attributes
  end
end
