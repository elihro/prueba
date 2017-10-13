class SoupsController < ApplicationController
	before_action :fetch_soup, only: [:destroy, :edit, :show, :toggle_featured, :update]

	def destroy
	end

	def edit
	end

	def index
		@soups = Soup.all

		respond_to do |format|
			format.json { render json: @soups }
		end
	end

	def new
	end

	def secret_soups
		session[:vip] = true
		redirect_to root_path
	end

	def show
		respond_to do |format|
			format.html
			format.json { render json: @soup }
		end
	end

	def toggle_featured
		@soup.toggle!(:featured)
		flash[:notice] = "Successfully changed the featured."
		redirect_to @soup
	end

	def update
	end

	private

	def fetch_soup
		@soup = Soup.find(params[:id])
	end	
end
