class PostController < ApplicationController
	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to root_path
		else
			flash[:notice] = "User ceated successfully"
		end
	end
	private
		def post_params
			params.require(:post).permit(:content)
		end
end