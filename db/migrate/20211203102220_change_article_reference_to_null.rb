class ChangeArticleReferenceToNull < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :address_id, :integer, null: true
  end
end
