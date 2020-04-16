class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create(params.require(:post).permit(:post, :profile_id))
        if @post.valid?
            redirect_to profile_path(@post.profile_id)
        else
            flash[:message] = @post.errors.full_messages
            redirect_to profile_path(@post.profile_id)
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(params.require(:post).permit(:post))
        if @post.valid?
            redirect_to profile_path(@post.profile)
        else
            flash[:error] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to profile_path(@post.profile)
    end
end
