class AdminsController < ApplicationController
	before_action :authenticate_admin!

	before_action :find_admin, only: [:dashboard]
	before_action :find_podcasts, only: [:show, :dashboard]
	before_action :find_episodes, only: [:show, :dashboard]

	def dashboard
		
	end

	private

	def find_episodes
		@episodes = Episode.all.order("created_at DESC")
		
	end

	def find_podcasts
		@podcast = Podcast.all.order("created_at DESC")
	end
end
