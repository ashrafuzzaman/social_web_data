class Profile < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profile_attributes, :join_table => "profiles_attributes"
  validates_uniqueness_of :name, :scope => :user_id
  after_create :create_default_attributes
  
  def create_default_attributes
    self.profile_attributes << ProfileAttribute.profile_attributes
  end
end
