class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.float :price
      t.text :desc
      t.boolean :sold
      t.integer :condition

      t.timestamps
    end
  end
end
