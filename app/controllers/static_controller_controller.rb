class StaticControllerController < ApplicationController
	def show
		@articles = Article.all
		render params[:page]
	end
end

