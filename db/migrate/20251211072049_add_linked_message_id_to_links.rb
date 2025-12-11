class AddLinkedMessageIdToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :linked_message_id, :integer, null: false
  end
end
