class ProfilesController < ApplicationController

    before_action :check_if_logged_in, only: [:edit]

    def index
        @profiles = Profile.all
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.create(params.require(:profile).permit(:fullname, :password))
        if @profile.valid?
            # session[:profile_id] = nil
            session[:profile_id] = @profile.id
            redirect_to @profile
        else
            flash[:error] = @profile.errors.first[1]
            redirect_to new_profile_path
        end
    end

    def show
        @profile = Profile.find(params[:id])
        @newpost = Post.new
    end

    def edit
        @profile = Profile.find(params[:id])
        unless logged_in? && logged_in_user.id == @profile.id
            redirect_to @profile
        end
    end

    def update
        @profile = Profile.find(params[:id])
        @profile.update(params.require(:profile).permit(:fullname, :password))
        if @profile.valid?
            redirect_to profile_path(@profile)
        else
            flash[:error] = @profile.errors.first[1]
            redirect_to edit_profile_path(@profile)
        end
    end

    def destroy
        @profile = Profile.find(params[:id])
        @profile.blogs.destroy
        @profile.summaries.destroy
        @profile.posts.destroy
        @profile.destroy
        redirect_to profiles_path
    end
end
