class PostCreator
	@queue = :posts_queue
	def self.perform(postid, params)
		@post = Post.find_by_id(postid)
		params.each do |x|
			@sp = @post.socialposts.create(installed_app_id: x)
		end
	end
end