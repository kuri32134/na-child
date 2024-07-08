class SearchesController < ApplicationController
 before_action :authenticate_user!, only: [:search]
 before_action :authenticate_leader!, only: [:retrieval]

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Leader"
      @leaders = Leader.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end 

  def retrieval
    @range = params[:range]
    @word = params[:word]

    if @range == "Leader"
      @leaders = Leader.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end 

end

