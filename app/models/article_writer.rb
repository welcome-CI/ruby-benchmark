class ArticleWriter < ApplicationRecord
  self.table_name = 'articles_writers'

  belongs_to :article
  belongs_to :writer
end
