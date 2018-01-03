class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.text :body
      t.references :relationship, index: true
      t.references :user, index: true
      t.integer :sender_id
      t.timestamps
    end
  end
end
