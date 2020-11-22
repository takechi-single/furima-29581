class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.valid?
      @user.save
      redirect_to action: :index
    end
  end
end
