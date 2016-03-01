class RemoveAttributesToAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :title, :string
  end
end
