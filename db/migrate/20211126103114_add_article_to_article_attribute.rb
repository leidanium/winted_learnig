class AddArticleToArticleAttribute < ActiveRecord::Migration[6.0]
  def change
    add_reference :article_attributes, :article, null: false, foreign_key: true
  end
end
