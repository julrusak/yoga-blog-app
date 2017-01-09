class TagsController < ApplicationController
  def index
  	@tags = Tag.all
  end

  def show
  	@tag = Tag.find(params[:id])
    @posts = @tag.posts
  end	

  def new
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new(tag_params)
  	respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_url, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:title)
    end

end
