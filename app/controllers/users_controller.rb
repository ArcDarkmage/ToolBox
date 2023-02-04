class UsersController < ApplicationController
  def show
    @user = policy_scope(User)
    authorize @user
  end
end
