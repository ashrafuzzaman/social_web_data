class ProfileAttribute < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profiles, :join_table => "profiles_attributes"
  has_many :profiles_attributes, :class_name => "ProfilesAttribute"

  attr_accessor :selected
  #scope :attributes_by_profiles, lambda {|profile_ids| joins(:profiles_attributes).where('profile_id in (?)', profile_ids).select("DISTINCT profiles_attributes.profile_attribute_id, profile_attributes.*") }
  def self.default_attributes

    attribute_list = [["Display name", "string"],
      ["Name", "string"],
      ["Nickname", "string"],
      ["Published", "date"],
      ["Updated", "date"],
      ["Birthday", "date"],
      ["Anniversary", "date"],
      ["Gender", "string"],
      ["Email", "string"],
      ["Phone", "string"],
      ["Address", "string"],
      ["Current city", "string"]
    ]

    profile_attributes = []
    attribute_list.each do |profile_attribute|
      profile_attributes << ProfileAttribute.create(:name => profile_attribute[0], :attribute_type => profile_attribute[1])
    end
    profile_attributes
  end

  def self.attributes_by_profiles(profile_ids)
    find(:all, :joins => [:profiles_attributes], :conditions => [ "profile_id in (?)", profile_ids])
  end
end
