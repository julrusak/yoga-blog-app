class PostTagsController < ApplicationController

	def new
	end

	def create
		@post_tag = PostTag.create(post_params)	
	end

	private
	def post_tags_params
		params.require(:post_tag).permit(:post_id, :tag_id)
	end
end
