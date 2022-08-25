class ApplicationController < ActionController::API
  def login
    # binding.pry
    user = User.find_by(email: params[:email])
    if user
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def welcome
    render "welcome"
  end
end
