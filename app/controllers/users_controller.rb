class UsersController < ApplicationController
  def verify_user
    email = params[:email]
    image = params[:image]
    user = User.find_by(email: email)
    if user
      validate = (user.image == image)
      render json: { validate: validate, message: validate ? 'Ok' : 'No Autorizado' }, status: :ok
    else
      render json: { validate: false, message: 'No Autorizado' }, status: 401
    end
  rescue StandardError => e
    puts e.message
    render json: { validate: false, message: 'No Autorizado' }, status: 401
  end
end
