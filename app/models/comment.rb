class Comment < ActiveRecord::Base

  default_scope :order => 'created_at ASC'
  belongs_to :user
  belongs_to :friend
  def user_email
    user.email if !user.nil?
  end

  def friends_email
    friend.email if !friend.nil?
  end

  def as_json(options={})
    super(
    :methods => [:user_email, :friends_email],
    :except => [:updated_at]
    )
  end
end
