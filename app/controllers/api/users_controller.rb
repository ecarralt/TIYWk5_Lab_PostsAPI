class Api::UsersController < ApplicationController


  protect_from_forgery with: :null_session


  before_action except: :create do
    :doorkeeper_authorize!
  end

  before_action do
    request.format = :json
  end


  def create
    @user = User.new
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    if @user.save
      render :show, status: 201
    else
      render json: {errors: @user.errors}, status: 422
    end

  end

  def delete
    @user = User.find_by id: params[:id]
    @user.destroy
    if User.find_by id: params[:id]
      render json: {error: "could not delete user with id: #{@user.id}"}, status: 422
    else
      render json: {message: "Successfully deleted user"}, status: 201
    end

  end


end
