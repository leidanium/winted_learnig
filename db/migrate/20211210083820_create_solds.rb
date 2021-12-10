class CreateSolds < ActiveRecord::Migration[6.0]
  def change
    create_table :solds do |t|
      t.references :article, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :price
      t.boolean :closed

      t.timestamps
    end
  end
end