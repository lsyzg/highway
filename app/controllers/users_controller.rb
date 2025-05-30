class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]
  before_action :require_authentication, only: [ :show, :edit, :update, :prize_box ]


  # def index
  #   @users = User.all
  # end

  def show
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = user.new(user_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def prize_box
    # No need to set anything special - the view will use current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(user: [ :email, :first_name, :last_name, :github, :username ])
  end
end
