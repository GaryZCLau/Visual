class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.create(params.require(:blog).permit(:title, :text))
        redirect_to new_summary_path
    end

    def show
        @blog = Blog.find(params[:id])
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])
        @blog.update(params.require(:blog).permit(:title, :text))
        redirect_to blog_path(@blog)
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path
    end
end
