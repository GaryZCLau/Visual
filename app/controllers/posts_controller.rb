class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(params.require(:post).permit(:post, :profile_id))
        redirect_to profile_path(@post.profile_id)
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(params.require(:post).permit(:post, :profile_id))
        redirect_to blog_path(@post)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to blogs_path
    end
end
