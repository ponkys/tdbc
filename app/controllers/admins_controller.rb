class AdminsController < ApplicationController
	before_action :authenticate_admin!
	before_action :find_podcasts, only: [:show, :dashboard, :edit, :update, :destroy]
	before_action :find_episodes, only: [:show, :dashboard]
	before_action :find_admin, only: [:dashboard]

	def dashboard
		@podcasts = Podcast.all.order("created_at DESC")
		
	end

	private

	def admin_params
		params.require(:admin).permit(:title, :thumbnail, :id)	
	end

	def podcast_params
		params.require(:episode).permit(:title, :description, :episode_thumbnail)	
	end

	def find_episodes
		@episodes = Episode.all.order("created_at DESC")
		
	end

	def find_podcasts
		@podcast = Podcast.all.order("created_at DESC")
	end

	def find_admin
		if params[:id].nil?
			@admin = current_admin
		else
			@admin = Admin.find(params[:id])
		end
	end
end
