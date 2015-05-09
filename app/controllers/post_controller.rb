class PostController < ApplicationController
	def create
		@post = current_user.posts.new(:content => params[:content])
		if @post.save
			Resque.enqueue(PostCreator, @post.id, params[:installed_app_id])
			redirect_to root_path
		else
			flash[:notice] = "User ceated successfully"
		end
	end
	private
		def post_params
			params.require(:content).permit(:content, :installed_app_id)
		end
end