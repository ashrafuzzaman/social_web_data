class ProfilesAttribute < ActiveRecord::Base
  belongs_to :profile
  belongs_to :profile_attributes
end
