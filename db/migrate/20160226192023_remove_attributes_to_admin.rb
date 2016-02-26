class RemoveAttributesToAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :admin_id, :integer
  end
end
