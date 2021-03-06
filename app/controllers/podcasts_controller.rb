class PodcastsController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :find_podcast, only: [:show, :edit, :update, :destroy]
	before_action :find_episode, only: [:show, :dashboard, :index]

	def new
		@podcast = Podcast.new
	end

	def create
		@podcast = Podcast.new podcast_params
		if @podcast.save
			redirect_to podcast_path(@podcast)
		else
			render 'new'	
		end
	end


	def index
		@podcasts = Podcast.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		@episodes = Episode.all
	end

	def show
			
	end

	def dashboard
		
	end

	def edit
		#@podcast = Podcast.find(params[:id])
	end

	def update
		if @podcast.update podcast_params
			redirect_to podcast_path(@podcast), notice: "Podcast was succesfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@podcast.destroy
		redirect_to root_path
	end

	private

	def podcast_params
		params.require(:podcast).permit(:title, :description, :thumbnail, :itunes, :soundcloud)	
	end

	def find_episode
		@episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
		
	end

	def find_podcast
		@podcast = Podcast.find(params[:id])
	end

	# def require_permission #episodio 24
	# 	@user = User.find(params[:role])
	# 	if admin != @user
	# 		redirect_to root_path, notice: "sorry, you are not allowed to view that page"
	# 	end
	# end
end
