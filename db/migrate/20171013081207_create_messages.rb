class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer       :user_id, foreignkey: true
      t.integer       :group_id, foreignkey: true
      t.string          :text, null: false
      t.string          :image, null: false
      t.timestamps
    end
  end
end
