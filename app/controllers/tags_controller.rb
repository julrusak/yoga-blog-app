class TagsController < ApplicationController
def index
	@tags = Tag.all
end

def show
	@tag = Tag.find(params[:id])
end	

def new
	@tag = Tag.new
end

def create
	@tag = Tag.new(post_params)
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
  respond_to do |format|
    if @tag.update(post_params)
      format.html { redirect_to tags_url, notice: 'Post was successfully updated.' }
      format.json { render :show, status: :ok, location: @tag }
    else
      format.html { render :edit }
      format.json { render json: @tag.errors, status: :unprocessable_entity }
    end
  end
end

private
  def post_params
    params.require(:post).permit(:title)
  end

end


end
