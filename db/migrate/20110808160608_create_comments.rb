class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :comment
      t.references :resource, :polymorphic => true
      t.references :user
      t.references :friend
      t.timestamps
    end

    add_index :comments, :resource_type
    add_index :comments, :resource_id
    add_index :comments, :user_id
    add_index :comments, :friend_id
  end

  def self.down
    drop_table :comments
  end
end
