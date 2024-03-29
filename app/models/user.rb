# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string           default("")
#  last_name              :string           default("")
#  username               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # reanable omniauthable removed
  # https://github.com/lynndylanhurley/devise_token_auth/blob/v0.1.36/app/models/devise_token_auth/concerns/user.rb#L23
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :comments, dependent: :destroy

  validates :uid, uniqueness: { scope: :provider }

  before_validation :init_uid

  def self.from_omniauth(access_token)
    data = access_token.info
    email_data = data['email']
    user = User.where(email: email_data).first

    unless user
      user = User.create first_name: data['first_name'],
                         last_name: data['last_name'],
                         avatar: data['image'],
                         email: email_data,
                         provider: 'Google',
                         password: Devise.friendly_token[0, 20],
                         uid: email_data

    end
    user
  end

  def full_name
    return username unless first_name.present?
    "#{first_name} #{last_name}"
  end

  def self.from_social_provider(provider, user_params)
    where(provider: provider, uid: user_params['id']).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.assign_attributes user_params.except('id')
    end
  end

  private

  def uses_email?
    provider == 'email' || email.present?
  end

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end
end
