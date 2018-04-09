# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  page_header        :string           not null
#  slug               :string           not null
#  body               :string
#  published          :boolean          default(FALSE)
#  tags               :string           default([]), is an Array
#  comments_permitted :boolean          default(TRUE)
#  category_id        :integer
#  published_at       :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_slug         (slug)
#

require 'rails_helper'

describe Article do
  describe 'validations' do
    subject { build :article }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:page_header) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to :category }
  end

  describe 'callbacks' do
    describe 'before_create' do
      context 'when title is not present' do
        let(:article) { build :article, title: nil }

        it 'does not raise an error' do
          expect { article.send(:assign_slug) }.not_to raise_error
        end
      end

      context 'when title is present' do
        let(:article) { build :article, title: 'My New Article' }

        it 'assigns the corresponding slug' do
          article.send(:assign_slug)

          expect(article.slug).to eq 'my-new-article'
        end
      end
    end
  end
end
