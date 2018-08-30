class UsersController < ApplicationController
   def my_portfolio
   	@user = current_user
   	@user_stocks = current_user.stocks
   end
   def my_friends
   	  @friends = current_user.friends
   end

   def search
   		if params[:friend].blank?
   			flash[:danger] = "enter an email"
   			redirect_to my_friends_path
   		else
   			@user_friend = User.find_by_email(params[:friend])
   			
   		end
   		respond_to do |format|
      		format.js { render partial: 'users/fresult' }
   		end

   end
end