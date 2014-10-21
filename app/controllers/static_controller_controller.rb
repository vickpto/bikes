class StaticControllerController < ApplicationController
	def show
		render params[:page]
	end
end

