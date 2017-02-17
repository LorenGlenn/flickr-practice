class TagsController < ApplicationController
  def new
    @tag = Tag.new
    @post = Post.find(params[:post_id])
  end
  def create
    @post = Post.find(params[:post_id])
    @tag = @post.tags.new(tag_params)
    if @tag.save
      redirect_to user_post_path(current_user, @post)
    else
      render :index
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
