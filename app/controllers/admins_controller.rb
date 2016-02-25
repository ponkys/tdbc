class AdminsController < ApplicationController
	before_action :authenticate_admin!

	before_action :find_podcasts, only: [:show, :dashboard]
	before_action :find_episodes, only: [:show, :dashboard]

	def dashboard
		@podcasts = Podcast.all.order("created_at DESC")
		@admin = Admin.where(params[:admin_params])
	end

	private

	def admin_params
		params.require(:admin).permit(:title, :thumbnail)	
	end

	def find_episodes
		@episodes = Episode.all.order("created_at DESC")
		
	end

	def find_podcasts
		@podcast = Podcast.all.order("created_at DESC")
	end
end
