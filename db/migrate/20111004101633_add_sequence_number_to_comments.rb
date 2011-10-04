class AddSequenceNumberToComments < ActiveRecord::Migration
  def self.up
		add_column :comments, :sequence_number, :integer
  end

  def self.down
		remove_column :comments, :sequence_number
  end
end
