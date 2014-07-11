class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  def self.find_or_create_from_twitter(oauth)
    if user = find_by(provider: oauth.provider, uid: oauth.uid)
      user.username = oauth.info.nickname
      user.avatar = oauth.info.image
      user.save
      user
    else
      create! do |user|
        user.email = oauth.info.email || oauth.uid+"@twitter.com"
        user.uid = oauth.uid
        user.username = oauth.info.nickname
        user.avatar = oauth.info.image
        user.provider = oauth.provider
        user.password = Devise.friendly_token[0,20]
      end
    end
  end
end
