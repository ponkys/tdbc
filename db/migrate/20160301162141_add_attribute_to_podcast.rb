class AddAttributeToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :soundcloud, :string
  end
end
