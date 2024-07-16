class Leader::UsersController < ApplicationController
 before_action :authenticate_leader!
 before_action :is_matching_login_leader

  def show
    @leader= Leader.find(params[:id])
  end


  def edit
    @leader = Leader.find(params[:id])
  end

  def update
    @leader= Leader.find(params[:id])
    if @leader.update(leader_params)
      redirect_to leader_user_path(@leader.id)
    else
      render :edit
    end
  end

  def is_matching_login_leader
    leader = Leader.find(params[:id])
    unless leader.id == current_leader.id
      redirect_to leader_posts_path
    end
  end

end
