class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.text :value
      t.references :user
      t.references :profile

      t.timestamps
    end
  end

  def self.down
    drop_table :statuses
  end
end
