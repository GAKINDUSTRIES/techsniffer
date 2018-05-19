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

class Message < ApplicationRecord
  belongs_to :admin

  validates :name, :email, :message, presence: true

  private

  def admin=(admin_attr)
    @admin = Admin.first
  end
end
