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
#
# Indexes
#
#  index_admins_on_email                 (email) UNIQUE
#  index_admins_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

describe Admin do
  describe 'validations' do
    subject { build :admin }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:website) }
    it { should validate_presence_of(:avatar) }
    it { should validate_presence_of(:bio) }
    it { should validate_presence_of(:projects_completed) }
    it { should validate_presence_of(:happy_clients) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:country_code) }
  end
end
