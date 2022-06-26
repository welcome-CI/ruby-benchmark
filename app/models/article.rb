class Article < ApplicationRecord
  has_many :articles_writers, class_name: 'ArticleWriter', dependent: :destroy
  has_many :writers, through: :articles_writers

  validates :title, presence: true
end
