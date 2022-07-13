class ArticleWriter < ApplicationRecord
  self.table_name = 'articles_writers'

  belongs_to :article
  belongs_to :writer

  validates :article_id, uniqueness: { scope: :writer_id }
end
