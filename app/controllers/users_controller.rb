class UsersController < ApplicationController

  def show
    @user = current_user

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @user, serializer: UserSerializer }
    end
  end
end
