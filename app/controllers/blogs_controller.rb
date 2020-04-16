class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(params.require(:blog).permit(:title, :text))
        if @blog.valid?
            @blog.save
            redirect_to new_summary_path(blog: @blog)
        else
            flash[:error] = @blog.errors.full_messages
            redirect_to new_blog_path
        end
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
        if @blog.valid?
            @blog.save
            redirect_to blog_path(@blog)
        else
            flash[:error] = @blog.errors.full_messages
            redirect_to edit_blog_path(@blog)
        end
    end

    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path
    end
end
