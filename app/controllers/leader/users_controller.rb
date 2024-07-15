class Leader::UsersController < ApplicationController
 before_action :authenticate_leader!, except: [:new, :create]
 before_action :is_matching_login_leader, except: [:new, :create]
 before_action :authorize_admin, only: [:new, :create]


  def show
    @leader= Leader.find(params[:id])
  end

  def new
    authenticate_admin!
    @leader = Leader.new
  end

  def create
    authenticate_admin!
    @leader = Leader.new(leader_params)
    if @leader.save
      redirect_to admin_dashboards_index_path
    else
      render :new
    end
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

private
  def leader_params
    params.require(:leader).permit(:name, :email, :password, :password_confirmation)
  end

  def authorize_admin
    return unless current_user.present? && !current_user.admin?
    redirect_to root_path, alert: '管理者以外アクセスできません!'
  end

end
