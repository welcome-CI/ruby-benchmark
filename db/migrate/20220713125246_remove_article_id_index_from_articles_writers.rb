class RemoveArticleIdIndexFromArticlesWriters < ActiveRecord::Migration[7.0]
  def change
    remove_index :articles_writers, :article_id
  end
end
