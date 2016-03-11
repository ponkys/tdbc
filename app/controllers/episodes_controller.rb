class EpisodesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index, :feed, :api]
	before_action :find_podcast, except: [:feed, :api]
	before_action :find_episode, only: [:show, :edit, :update, :destroy]

	def new
		@episode = @podcast.episodes.new
	end

	def create
		@episode = @podcast.episodes.new episode_params
		if @episode.save
			redirect_to podcast_episode_path(@podcast, @episode)
		else
			render 'new'	
		end
	end

	def api
	    @episodes = Episode.all
	    respond_to do |format|
			format.json { render json: @episodes}
		end
	end

	def feed
	    @episodes = Episode.all
	    #render(:layout => false)
	    render 'episodes/feed.rss.builder'
	end

	def show
		@episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").reject { |e| e.id == @episode.id }
	end

	def edit
		
	end

	def update
		if @episode.update episode_params
			redirect_to podcast_episode_path(@podcast, @episode), notice: "Episode was succesfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@episode.destroy
		redirect_to root_path
	end

	private

	def episode_params
		params.require(:episode).permit(:title, :description, :episode_thumbnail, :mp3)	
	end

	def find_podcast
		@podcast = Podcast.find(params[:podcast_id])
	end

	def find_episode
		@episode = Episode.find(params[:id])
	end


	# def require_permission #episodio 24 es para que otras personas no se metan ni creen en nuevas formas de los demas solo en la de uno.
	# 	@podcast = Podcast.find(params[:podcast_id])
	# 	if current_podcast != @podcast
	# 		redirect_to root_path, notice: "sorry, you are not allowed to view that page"
	# 	end
	# end
end