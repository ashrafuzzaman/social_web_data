class ProfileAttribute < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profiles, :join_table => "profiles_attributes"
  
  attr_accessor :selected
  
  def self.default_attributes
    profile_attributes = []
    profile_attributes << ProfileAttribute.create(:name => "First name", :attribute_type => "string")
    profile_attributes << ProfileAttribute.create(:name => "Last name", :attribute_type => "string")
    profile_attributes << ProfileAttribute.create(:name => "Sex", :attribute_type => "string")
    profile_attributes << ProfileAttribute.create(:name => "Phone", :attribute_type => "string")
    profile_attributes << ProfileAttribute.create(:name => "email", :attribute_type => "string")
    profile_attributes << ProfileAttribute.create(:name => "Born on", :attribute_type => "date")
    profile_attributes << ProfileAttribute.create(:name => "Current city", :attribute_type => "date")
    profile_attributes
  end
end
