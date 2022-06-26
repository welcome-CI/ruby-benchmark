class Writer < ApplicationRecord
  has_many :articles_writers, class_name: 'ArticleWriter', dependent: :destroy
  has_many :articles, through: :articles_writers

  validates :name, presence: true
end
