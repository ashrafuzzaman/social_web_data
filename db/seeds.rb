ProfileAttribute.delete_all
Profile.delete_all
Friend.delete_all
User.delete_all
u1 = User.create(:email => "ashrafuzzaman.g2@gmail.com", :password => "123456")
p1 = u1.profiles.create!(:name => "Master profile")
p1.attributes = u1.profile_attributes

u2 = User.create(:email => "sust.rumjhum@gmail.com", :password => "123456")
p2 = u2.profiles.create!(:name => "Facebook")
p2.attributes = u2.profile_attributes

data_store = 'http://10.0.2.2:3001'
#data_store = 'http://social-web-data.heroku.com'
#f1 = u1.friends.create(:email => "sust.rumjhum@gmail.com", :shared_key => "asdfgh", :status => "accepted", :data_store => data_store)
#f2 = u2.friends.create(:email => "ashrafuzzaman.g2@gmail.com", :shared_key => "asdfgh", :status => "accepted", :data_store => data_store)