class UsersController < ApplicationController

  def edit
  end

  def update
     if current_user.update(user_params)
       redirect_to root_path
     elsif
       render :edit
     end
  end

  def user_params
    params[:user].permit(:name, :email)
  end

end
