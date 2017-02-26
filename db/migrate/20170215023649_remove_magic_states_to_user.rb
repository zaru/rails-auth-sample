class RemoveMagicStatesToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :active, :boolean
    remove_column :users, :approved, :boolean
    remove_column :users, :confirmed, :boolean
  end
end
