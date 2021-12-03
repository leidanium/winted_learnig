class CreateArticleCharacteristics < ActiveRecord::Migration[6.0]
  def change
    create_table :article_characteristics do |t|
      t.string :value
      t.references :article, null: false, foreign_key: true
      t.references :characteristics, null: false, foreign_key: true

      t.timestamps
    end
  end
end
