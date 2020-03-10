class RelationshipsController < ApplicationController
	before_action :set_user

	def create
	  # user =　User.find(params[:relationship][:follow_id])
	  # binding.pry
  	  user = User.find(params[:follow_id])

	  following = current_user.follow(user)
	  if following.save
	  	flash[:success] ='ユーザーをフォローしました'
	  	redirect_back(fallback_location: users_path)
	  else
	  	flash.now[:alert] = 'ユーザーのフォローに失敗しました'
	  	redirect_back(fallback_location: users_path)
	  end
	end

	def destroy
		# user = User.find(params[:relationship][:follow_id])
		user = User.find(params[:follow_id])
		following = current_user.unfollow(user)
		if following.destroy
		  flash[:success] = 'ユーザーのフォローを解除しました'
		  redirect_back(fallback_location: user_path(user))
		else
			flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
			redirect_back(fallback_location: user_path(user))
		end
	end

	private

	def set_user
	  user = User.find(params[:follow_id])
	end
end
