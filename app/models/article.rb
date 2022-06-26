class Article < ApplicationRecord
  has_many :articles_writers, class_name: 'ArticleWriter', dependent: :destroy
  has_many :writers, through: :articles_writers

  accepts_nested_attributes_for :articles_writers, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
end
