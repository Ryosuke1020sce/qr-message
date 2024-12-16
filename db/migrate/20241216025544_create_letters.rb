class CreateLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :letters do |t|

      t.text :text,          null: false
      t.references :message, null: false, foreign_key: true

      t.timestamps
    end
  end
end
