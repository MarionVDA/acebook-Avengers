# frozen_string_literal: true

class ProfilesController < ApplicationController
  def index; end

  def create
    @profile = Profile.create(user_id: @user.id)
  end

  def edit
    @profile = current_user.profile
  end

  private

  def profile_params
    params.require(:user_id).permit(:email, :username)
  end
end
