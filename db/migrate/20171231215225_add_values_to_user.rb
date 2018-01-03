class AddValuesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :given_name, :string
    add_column :users, :family_name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :profession, :string
    add_column :users, :bio_short, :string
    add_column :users, :bio_long, :string
    add_column :users, :location, :string
  end
end
