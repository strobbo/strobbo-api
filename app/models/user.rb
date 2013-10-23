class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :rememberable,
  # :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
	attr_accessible :email, :encrypted_password, :provider, :uid, :name, :image, :location, 
									:profile_url, :image_url, :gender, :birthday


  # Relacionamentos nos quais o usuário possuis status em lugares
  has_many :statuses
  has_many :places, through: :statuses

	def self.find_for_facebook_oauth(auth, signed_in_resource=nil)

		user = User.find_or_create_by_provider_and_uid(auth.provider, auth.uid)
		user.update_attributes(	 
													 name: auth.extra.raw_info.name,
		                       provider: auth.provider,
		                       uid: auth.uid,
		                       email: auth.info.email,
													 profile_url: auth.info.urls.Facebook,
													 image_url: auth.info.image,
													 gender: auth.extra.raw_info.gender,
													 birthday: Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y').strftime('%Y-%m-%d'),
													 location: auth.info.location
		                      )
		user
	end

end
