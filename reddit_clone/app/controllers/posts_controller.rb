class PostsController < ApplicationController
  before_action :require_author, only: [:edit, :update]
  
  def new 
    @subs = Sub.all 
  end

  def create 
    @post = Post.new(post_params)
    @post.author_id = current_user.id 
    
    if @post.save!
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end 

  def show 
    @post = Post.find(params[:id])
  end 

  def index 
    @posts = Post.all 
  end 

  def edit 
    @post = Post.find(params[:id])
  end 

  def update 
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params) 
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end 

  # def destroy 
  #   @post = Post.find(params[:id])
  #   @post.destroy 
  #   redirect_to sub_url(@post.sub_id) # would need to change this
  # end

  def require_author 
    @post = Post.find(params[:id])
    redirect_to sub_url(@post.sub_id) unless @post.author_id == current_user.id 
  end

  private 
  def post_params 
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
