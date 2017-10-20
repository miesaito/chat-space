class ChangColumToMessage < ActiveRecord::Migration[5.0]
  def change
    change_column :messages, :image, :string, null: true
    change_column :messages, :text, :string, null: true
  end
end
