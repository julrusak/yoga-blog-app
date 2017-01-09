class PostsController < ApplicationController

def index
	@posts = Post.all
end

def show
	@post = Post.find(params[:id])
  @post_tags = @post.tags
end	

def new
	@post = Post.new
  @tags = Tag.all
end

def create
	@post = Post.create(post_params)
  @post_tags = params[:post][:tag_ids]
  @post_tags.each do |tag|
    if tag != "" 
      PostTag.create(post_id: @post.id, tag_id: tag)
    end
  end
	respond_to do |format|
    if @post.save
      format.html { redirect_to @post, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: @post }
    else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  respond_to do |format|
    if @post.update(post_params)
      format.html { redirect_to posts_url, notice: 'Post was successfully updated.' }
      format.json { render :show, status: :ok, location: @post }
    else
      format.html { render :edit }
      format.json { render json: @post.errors, status: :unprocessable_entity }
    end
  end
end

private
  def post_params
    params.require(:post).permit(:title, :subtitle, :intro, :text, :conclusion, :image)
  end

end
