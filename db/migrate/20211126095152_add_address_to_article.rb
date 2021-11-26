class AddAddressToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :address, null: false, foreign_key: true
  end
end
