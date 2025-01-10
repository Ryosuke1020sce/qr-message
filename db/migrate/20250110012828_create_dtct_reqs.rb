class CreateDtctReqs < ActiveRecord::Migration[7.0]
  def change
    create_table :dtct_reqs do |t|

      t.string     :memo
      t.references :message, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
