class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :find_podcasts, only: [:show, :dashboard, :edit, :update, :destroy]
	before_action :find_episodes, only: [:show, :dashboard]
	before_action :find_user, only: [:dashboard]

	def dashboard
		@podcasts = Podcast.all.order("created_at DESC")
		
	end

	private

	def user_params
		params.require(:user).permit(:name, :thumbnail, :id)	
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

	def find_user
		if params[:id].nil?
			@user = current_user
		else
			@user = User.find(params[:id])
		end
	end
end
