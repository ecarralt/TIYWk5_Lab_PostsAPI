class Api::PostsController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :doorkeeper_authorize!

  before_action do
    request.format = :json
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by id: params[:id]
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    if @post.save
      render :show, status: 201
    else
      render json: {errors: @post.errors}, status: 422
    end

  end

  def update
    @post = Post.find_by id: params[:id]
    @post.title = params[:post][:title]
    if @post.save
      render :show, status: 201
    else
      render json: {errors: @post.errors}, status: 422
    end

  end

  def delete
    @post = Post.find_by id: params[:id]
    @post.destroy
    if Post.find_by id:params[:id]
      render json: {error: "could not delete post with id: #{@post.id}"}, status: 422
    else
      render json: {message: "Successfully deleted"}, status: 201
    end

  end

end
