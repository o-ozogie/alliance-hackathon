class UsersController < ApplicationController
  def index
    render json: { hello: 'world' }, status: :ok
  end
end
