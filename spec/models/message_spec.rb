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

require 'rails_helper'

describe Message do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:message) }
  end
end
