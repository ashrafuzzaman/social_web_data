class Friend < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :profiles, :join_table => :profiles_friends
  validates_uniqueness_of :email, :scope => :user_id

  scope :requested, where(:status => "requested")
  scope :received_request, where(:status => "received_request")

  def request!
    update_attribute(:status, "requested")
  end

  scope :received_request, where(:status => "received_request")
  def receive_request!
    update_attribute(:status, "received_request")
  end

  def accept!
    update_attribute(:status, "accepted")
  end

  def deny!
    update_attribute(:status, "denied")
  end


end