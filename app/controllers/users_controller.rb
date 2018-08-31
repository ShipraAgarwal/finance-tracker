class UsersController < ApplicationController
   def my_portfolio
   	@user = current_user
   	@user_stocks = current_user.stocks
   end
   def my_friends
        @user = current_user
   	  @friends = current_user.friends
   end

   def profile
      @user = User.find(params[:format])
      @user_stocks = @user.stocks
      @friends = @user.friends
      render 'users/profile'
   end

   def search
   		if params[:friend].blank?
   			flash[:danger] = "enter an email"
   			redirect_to my_friends_path
   		else
   			@user_friend = User.search(params[:friend])
   			
   		end
   		respond_to do |format|
      		format.js { render partial: 'users/fresult' }
   		end

   end

end