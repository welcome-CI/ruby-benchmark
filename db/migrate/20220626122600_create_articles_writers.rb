class CreateArticlesWriters < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_writers do |t|
      t.references :article, null: false, foreign_key: true
      t.references :writer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
