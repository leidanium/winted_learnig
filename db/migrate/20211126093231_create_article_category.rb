class CreateArticleCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
    end
  end
end
