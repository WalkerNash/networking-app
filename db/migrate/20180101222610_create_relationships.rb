class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :inviting_id
      t.integer :invited_id

      t.timestamps
    end
  end
end
