class Admin::DashboardsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.all
    @leaders = Leader.all
  end
end
