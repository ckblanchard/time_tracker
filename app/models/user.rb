class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:twitter]

  has_one :profile

  delegate :name, :phone_number, :city, :state, to: :profile

  after_create :initialize_profile

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

  def name
    profile.name.blank? ? self.username || self.email : profile.name
  end

  private

    def initialize_profile
      self.create_profile(
        name: "",
        address: "",
        address2: "",
        city: "",
        state: "",
        zip_code: "",
        phone_number: "")
    end

end
