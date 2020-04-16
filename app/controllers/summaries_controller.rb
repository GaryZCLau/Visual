class SummariesController < ApplicationController      
    def index
        @summaries = Summary.all
    end

    def new
        @summary = Summary.new
        @blog = Blog.find(params[:blog])
    end

    def create
        @summary = Summary.new(params.require(:summary).permit(:summary, :profile_id, :blog_id))
        @sumary.profile_id = 
        @sumary.save
        redirect_to profile_path(@summary.profile)
    end

    def show
        @summary = Summary.find(params[:id])
    end

    def edit
        @summary = Summary.find(params[:id])
    end

    def update
        @summary = Summary.find(params[:id])
        @summary.update(params.require(:summary).permit(:summary, :profile_id, :blog_id))
        redirect_to profile_path(@summary.profile)
    end

    def destroy
        @summary = Summary.find(params[:id])
        @summary.blog.destroy
        @summary.destroy
        redirect_to profile_path(@summary.profile)
    end
end
