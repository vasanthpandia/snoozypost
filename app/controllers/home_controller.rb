class HomeController < ApplicationController
	def home
	@post = Post.new
	end
end
