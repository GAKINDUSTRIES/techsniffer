# == Schema Information
#
# Table name: admins
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string           not null
#  last_name              :string           not null
#  username               :string           not null
#  website                :string           not null
#  avatar                 :string           not null
#  bio                    :string           not null
#  projects_completed     :integer          not null
#  happy_clients          :integer          not null
#  phone                  :string           not null
#  address                :string           not null
#  city                   :string           not null
#  zipcode                :string           not null
#  country_code           :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

class Admin < ApplicationRecord
  include AdminRailsAdmin

  has_many :work_experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :recommendations, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :first_name,
            :last_name,
            :username,
            :website,
            :avatar,
            :projects_completed,
            :bio,
            :happy_clients,
            :phone,
            :address,
            :city,
            :zipcode,
            :country_code, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
