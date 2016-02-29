class RemoveAttributesToPodcast < ActiveRecord::Migration
  def change
    remove_column :podcasts, :email, :string
    remove_column :podcasts, :encrypted_password, :string
    remove_column :podcasts, :reset_password_token, :string
    remove_column :podcasts, :reset_password_sent_at, :datetime
    remove_column :podcasts, :remember_created_at, :datetime
    remove_column :podcasts, :sign_in_count, :integer
    remove_column :podcasts, :current_sign_in_at, :datetime
    remove_column :podcasts, :last_sign_in_at, :datetime
    remove_column :podcasts, :current_sign_in_ip, :inet
    remove_column :podcasts, :last_sign_in_ip, :inet
  end
end
