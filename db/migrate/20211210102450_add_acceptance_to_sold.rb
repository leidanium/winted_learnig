class AddAcceptanceToSold < ActiveRecord::Migration[6.0]
  def change
    add_column :solds, :accept, :boolean
  end
end
