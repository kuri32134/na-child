class Admin::LeadersController < ApplicationController
  
  before_action :authenticate_admin!
  def index
  end
  
  def destroy
    @leader = Leader.find(params[:id])
    @leader.destroy
    redirect_to admin_dashboards_index_path, notice: 'リーダーを削除しました。'
  end
  
end
