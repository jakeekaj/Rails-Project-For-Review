class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :omniauth_providers => [:facebook]

  has_many :reviews
  has_many :movies, through: :reviews
  has_many :movies

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.email      = auth.info.email
      user.password   = Devise.friendly_token[0,20]
    end
  end

  def self.current_id=(id)
    Thread.current[:current_user_id] = id
    Thread.current[:current_user] = User.find_by_id(id)
  end

  def self.current_id
    Thread.current[:current_user_id]
  end

  def self.current
    Thread.current[:current_user] || User.find(current_id) if current_id.present?
  end
end
