class FriendsController < ApplicationController
	def create
		user = User.find(params[:friend])
		@user_friend = Friendship.create(user: current_user, friend: user )
		flash[:sucess] = "you have successfully added a friend"
		redirect_to my_friends_path

	end
	def destroy
		friend = User.find(params[:id])
	    @user_friend = Friendship.where(friend_id: friend.id, user_id: current_user.id).first
	    @user_friend.destroy
	    flash[:notice] = "friend is successfully deleted"
	    redirect_to my_friends_path
	end
end