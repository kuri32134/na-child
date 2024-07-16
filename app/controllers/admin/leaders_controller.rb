class Admin::LeadersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def new
    @leader = Leader.new
  end
  
  def create
    @leader = Leader.new(leader_params)
    if @leader.save
      redirect_to admin_dashboards_index_path
    else
      render :new
    end
  end

  def destroy
    @leader = Leader.find(params[:id])
    @leader.destroy
    redirect_to admin_dashboards_index_path, notice: 'リーダーを削除しました。'
  end
  
  private
  def leader_params
    params.require(:leader).permit(:name, :email, :password, :password_confirmation)
  end
  
end
