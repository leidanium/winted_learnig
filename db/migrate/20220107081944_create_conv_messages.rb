class CreateConvMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :conv_messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :user
      t.text :message

      t.timestamps
    end
  end
end
