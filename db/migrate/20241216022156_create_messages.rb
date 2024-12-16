class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :to
      t.string :date
      t.string :from
      t.boolean :permit_comment, null: false

      t.timestamps
    end
  end
end
