class PostsController < ApplicationController
before_action :require_logged_in
before_action :authors_only, only: [:edit, :update]


  def authors_only
    if current_user.posts.find(params[:id]).nil?
      redirect_to post_url(params[:id])
    end 
  end

  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
  end

  def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new

    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  
end
