class AddIndexToArticlesWriters < ActiveRecord::Migration[7.0]
  def change
    add_index :articles_writers, %i[article_id writer_id], unique: true
  end
end
