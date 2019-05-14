class PostsController < ApplicationController

  def top
  end

  def show

    @post = Post.find(params[:id])

  end

  def index

    @post = Post.new

    @posts = Post.all.order(id: "DESC")


  end

  def create

    post = Post.new(post_params)

    if post.save
      flash[:notice] = "Book was successfully created."
      redirect_to post_path(post)
    end

  end


  def edit

    @post = Post.find(params[:id])

  end

  def update

    post = Post.find(params[:id])

    if post.save
      flash[:notice] = "Book was successfully updated."
      redirect_to post_path(@post)
    end

  end

  def destroy

    post = Post.find(params[:id])

    if post.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to posts_path
    end

  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

