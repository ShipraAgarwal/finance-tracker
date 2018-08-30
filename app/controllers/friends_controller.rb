class FriendsController < ApplicationController
	def create
		user = User.find(params[:friend])
		@user_friend = Friendship.create(user: current_user, friend: user )
		flash[:sucess] = "you have successfully added a friend"

	end
	def destroy

	end
end