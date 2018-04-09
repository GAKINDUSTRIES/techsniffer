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

class Category < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
