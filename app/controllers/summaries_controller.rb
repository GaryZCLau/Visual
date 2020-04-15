class SummariesController < ApplicationController      
    def index
        @summaries = Summary.all
    end

    def new
        @summary = Summary.new
    end

    def create
        @summary = Summary.create(params.require(:summary).permit(:summary, :profile_id, :blog_id))
        redirect_to summary_path(@summary)
    end

    def show
        @summary = Summary.find(params[:id])
    end

    def edit
        @summary = Summary.find(params[:id])
    end

    def update
        @summary = Summary.find(params[:id])
        @summary.update(params.require(:summary).permit(:))
        redirect_to summary_path(@summary)
    end

    def destroy
        @summary = Summary.find(params[:id])
        @summary.destroy
        redirect_to summaries_path
    end
end
