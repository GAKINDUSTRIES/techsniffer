# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  subject    :string
#  message    :string           not null
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_admin_id  (admin_id)
#

FactoryBot.define do
  factory :message do
    name    { Faker::Internet.unique.user_name }
    email   { Faker::Internet.unique.email }
    subject { Faker::Lorem.unique.sentence }
    message { Faker::Lorem.paragraph }
  end
end
