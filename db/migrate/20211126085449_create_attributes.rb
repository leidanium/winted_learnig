class CreateAttributes < ActiveRecord::Migration[6.0]
  def change
    create_table :attributes do |t|
      t.string :name
      t.integer :v_type

      t.timestamps
    end
  end
end
