class Leader::HomesController < ApplicationController
  before_action :authenticate_leader!
  def top
  end
end
