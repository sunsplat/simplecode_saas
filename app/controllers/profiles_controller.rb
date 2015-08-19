class ProfilesController < ApplicationController
    
    def new
        # form where a user can fill out their own profile
        @user = User.find(params[:user_id]) # tells us who is logged in
        @variable = params[:hello]
        @profile = @user.build_profile
    end
    
end