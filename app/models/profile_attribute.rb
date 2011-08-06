class ProfileAttribute < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profiles, :join_table => "profiles_attributes"
  has_many :profiles_attributes, :class_name => "ProfilesAttribute"
  
  attr_accessor :selected

  #scope :attributes_by_profiles, lambda {|profile_ids| joins(:profiles_attributes).where('profile_id in (?)', profile_ids).select("DISTINCT profiles_attributes.profile_attribute_id, profile_attributes.*") }
  
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
  
  def self.attributes_by_profiles(profile_ids)
    find(:all, :joins => [:profiles_attributes], :conditions => [ "profile_id in (?)", profile_ids])
  end
end
