class CreateArticleAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :article_attributes do |t|
      t.string :value
      t.references :attribute

      t.timestamps
    end
  end
end
