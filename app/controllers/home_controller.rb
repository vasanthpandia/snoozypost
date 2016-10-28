class HomeController < ApplicationController
  before_filter :ensure_signed_in, only: :home

	def home
    @post = current_user.posts.new
    @post.socialposts.build
	end

  def index
  end
end
