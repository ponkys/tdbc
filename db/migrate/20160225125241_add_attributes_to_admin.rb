class AddAttributesToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :title, :string
  end
end
