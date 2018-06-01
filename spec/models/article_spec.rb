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
#  summary            :string           not null
#  bio                :text
#
# Indexes
#
#  index_articles_on_category_id   (category_id)
#  index_articles_on_published     (published)
#  index_articles_on_published_at  (published_at)
#  index_articles_on_slug          (slug)
#

require 'rails_helper'

describe Article do
  describe 'validations' do
    subject { build :article }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:page_header) }
    it { is_expected.to validate_presence_of(:summary) }
    it { is_expected.to validate_presence_of(:slug) }
    it { is_expected.to validate_uniqueness_of(:slug) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to :category }
  end

  describe 'callbacks' do
    describe 'before_create' do
      describe '#assign_slug' do
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

  describe 'scopes' do
    describe 'latest' do
      context 'when there are not articles in the system' do
        it 'does not raise an error' do
          expect { Article.latest }.to_not raise_error
        end
      end

      context 'when there are articles in the system' do
        let!(:articles) { create_list :article, 5 }

        it 'returns only 4 articles' do
          expect(Article.latest.size).to eq 4
        end

        it 'returns articles ordered by published_at' do
          expect(Article.latest
                        .map(&:published_at)
                        .each_cons(2).all? { |left, right| left >= right })
            .to be_truthy
        end
      end
    end
  end
end
