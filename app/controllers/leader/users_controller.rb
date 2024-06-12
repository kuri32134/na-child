class Leader::UsersController < ApplicationController
  def show
    @leader= Leader.find(params[:id])
  end

  def edit
    @leader = Leader.find(params[:id])
  end
  
  def update
    @leader= Leader.find(params[:id])
    @leader.update(leader_params)
    redirect_to leader_user_path(@leader.id)
  end
  
  def leader_params
    params.require(:leader).permit(:name, :email)
  end
  
end
