class UsersController < ApplicationController
  def create
    # binding.pry
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])

    if user.save && user.valid?
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    # binding.pry
    user = User.find_by_id(params[:id])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
end
