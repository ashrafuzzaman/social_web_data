class Status < ActiveRecord::Base
  belongs_to :user
  belongs_to :profile

  default_scope :order => 'created_at DESC'
  scope :comments, where(:resource_type => "Status", :resource_id => id)

  def profile_name
    profile.name
  end

  def as_json(options={})
    super(
    :methods => [:profile_name],
    :except => [:updated_at]
    )
  end
end
