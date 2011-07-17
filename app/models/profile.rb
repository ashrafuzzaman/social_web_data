class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profile_attributes, :join_table => "profiles_attributes"
  has_and_belongs_to_many :friends, :join_table => :profiles_friends 

  validates_uniqueness_of :name, :scope => :user_id

end
