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

FactoryBot.define do
  factory :admin do
    first_name         { Faker::Name.first_name }
    last_name          { Faker::Name.last_name }
    username           { first_name }
    email              { Faker::Internet.email }
    website            { Faker::Internet.url }
    avatar             { Rails.root.join('spec/support/blank.jpg').open }
    bio                { Faker::Lorem.paragraph }
    projects_completed { 150 }
    happy_clients      { 350 }
    phone              { Faker::PhoneNumber.cell_phone }
    address            { Faker::Address.street_address }
    city               { Faker::Address.city }
    zipcode            { Faker::Address.zip_code }
    country_code       { Faker::Address.country_code }
    password           { Devise.friendly_token[0, 20] }
  end
end
