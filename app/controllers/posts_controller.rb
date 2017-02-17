class PostsController < ApplicationController
  def index
    @posts = current_user.posts
    @search = Post.last
  end

  def show
    @post = Post.find(params[:id])
    @tag = Tag.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new

  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      @posts = current_user.posts
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    @found = Post.basic_search(params['/'][:search_string])
    render :search
  end

  private
  def post_params
    params.require(:post).permit(:title, :photo)
  end
end
