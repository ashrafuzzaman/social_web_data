class ProfileAttribute < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profiles, :join_table => "profiles_attributes"
end
