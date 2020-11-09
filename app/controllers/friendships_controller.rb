class FriendshipsController < ApplicationController
  def create
    # friend = User.find_by(id: params[:friend])
    current_user.friendships.build(friend_id: params[:friend])
    if current_user.save
      flash[:notice] = 'Started following'
    else
      flash[:alert] = 'Errrorrrr'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    friendship = current_user.friendships.find_by(friend_id: params[:id])
    if friendship.destroy
      flash[:notice] = 'Stopped following'
      redirect_to friends_path
    else
      flash[:alert] = 'Errrorrrr'
    end
  end
end
