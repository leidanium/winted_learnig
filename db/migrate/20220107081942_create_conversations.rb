class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :article, null: false, foreign_key: true
      t.references :c_seller, null: false
      t.references :c_buyer, null: false

      t.timestamps
    end

    add_foreign_key :conversations, :users, column: :c_seller_id
    add_foreign_key :conversations, :users, column: :c_buyer_id
  end
end
