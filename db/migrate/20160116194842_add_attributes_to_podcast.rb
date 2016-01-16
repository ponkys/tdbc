class AddAttributesToPodcast < ActiveRecord::Migration
  def change
    add_column :podcasts, :title, :string
    add_column :podcasts, :description, :text
    add_column :podcasts, :itunes, :string
  end
end
