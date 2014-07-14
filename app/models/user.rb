class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:trello]

  validates :name, :trello_token, :trello_secret, presence: true

  before_save :ensure_authentication_token

  def ensure_authentication_token
    return if authentication_token.presence
    self.authentication_token = generate_authentication_token
  end

  def self.from_trello_oauth auth_data
    User.where(provider: 'trello', uid: auth_data.uid).first_or_create do |user|
      user.email = auth_data.info.email
      user.name = auth_data.info.name
      user.password = Devise.friendly_token
      user.password_confirmation = user.password
      user.trello_token = auth_data.extra.access_token.token
      user.trello_secret = auth_data.extra.access_token.secret
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
