# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :category do
    name        { Faker::Lorem.unique.word }
    description { Faker::Lorem.sentence }
  end
end
