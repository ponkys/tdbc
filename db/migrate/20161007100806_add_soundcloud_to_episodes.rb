class AddSoundcloudToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :soundcloud, :string
  end
end
