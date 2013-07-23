class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :rememberable, :trackable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
	attr_accessible :email, :encrypted_password, :remember_me, :provider, :uid, :name, :image, :location, 
									:access_token

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		unless user
		  user = User.create(name:auth.extra.raw_info.name,
		                       provider:auth.provider,
		                       uid:auth.uid,
		                       email:auth.info.email,
													 image:auth.info.image,
													 location:auth.info.location,
													 access_token:auth.credentials.token,
		                       encrypted_password:Devise.friendly_token[0,20]
		                       )
		end
		user
	end
end
