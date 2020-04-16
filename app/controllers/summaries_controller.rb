class SummariesController < ApplicationController
    
    before_action :check_if_logged_in
    
    def index
        @summaries = Summary.all
    end

    def new
        @summary = Summary.new
        @blog = Blog.find(params[:blog])
    end

    def create
        @summary = Summary.new(params.require(:summary).permit(:summary, :profile_id, :blog_id))
        @summary.profile_id = session[:profile_id]
        if @summary.valid?
            @summary.save
            redirect_to profile_path(@summary.profile)
        else
            flash[:error] = @summary.errors.first[1]
            redirect_to new_summary_path(blog: Blog.last.id)
        end
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
        if @summary.valid?
            redirect_to profile_path(@summary.profile)
        else
            flash[:error] = @summary.errors.first[1]
            redirect_to edit_summary_path(@summary)
        end
    end

    def destroy
        @summary = Summary.find(params[:id])
        @summary.blog.destroy
        @summary.destroy
        redirect_to profile_path(@summary.profile)
    end
end
