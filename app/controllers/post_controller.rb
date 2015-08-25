class PostController < ApplicationController
	def create
		@post = current_user.posts.new(content: params[:content], image: params[:post_image])
		if @post.save
			Resque.enqueue(PostCreator, @post.id, params[:installed_app_id])
			redirect_to root_path
		else
			flash[:notice] = "User ceated successfully"
		end
	end

	private

	def post_params
		params.require(:content).permit(:content, :post_image, :installed_app_id)
	end
end