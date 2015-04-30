class DispensariesController < ApplicationController
	def show
		@dispensary = Dispensary.find(params[:id])
	end

	def edit

	end

	def index
		@dispensaries = Dispensary.all
	end

end
