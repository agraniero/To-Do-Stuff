class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :description
      t.integer :user_id
    end
  end
end
