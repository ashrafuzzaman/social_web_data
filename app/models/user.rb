class User < ActiveRecord::Base
  has_many :profiles, :dependent => :destroy
  has_many :profile_attributes, :dependent => :destroy
  has_many :friends, :dependent => :destroy
  has_many :status, :class_name => "Status", :dependent => :destroy

  after_create :populate_default_attributes
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
    user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def populate_default_attributes
    profile_attributes << ProfileAttribute.default_attributes
  end
end
