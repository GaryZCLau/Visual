class ProfilesController < ApplicationController
    def index
        @profiles = Profile.all
    end

    def new
        @profile = Profile.new
    end

    def create
        @profile = Profile.create(params.require(:profile).permit(:fullname))
        redirect_to @profile
    end

    def show
        @profile = Profile.find(params[:id])
        @newpost = Post.new
    end

    def edit
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])
        @profile.update(params.require(:profile).permit(:fullname))
        redirect_to profile_path(@profile)
    end

    def destroy
        @profile = Profile.find(params[:id])
        @profile.destroy
        redirect_to profiles_path
    end
end
