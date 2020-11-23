class UsersController < ApplicationController
  before_action :jwt_required, except: %i[login]
  before_action :user?, except: %i[login]

  def login
    params.require(%i[email password])

    user = User.find_by_email(params[:email])
    UnauthorizedException::UnauthorizedUser.except if user.nil?
    UnauthorizedException::UnauthorizedUser.except unless user.password == params[:password]

    render json: {
      access_token: ForbiddenException::JWT_BASE.create_access_token({ sub: user.email }),
      refresh_token: ForbiddenException::JWT_BASE.create_refresh_token({ sub: user.email })
    }, status: :ok
  end

  def show
    render json: { name: @user.name,
                   address: @user.address,
                   blood_type: @user.blood_type }, status: :ok
  end

  def update
    params.require(%i[name address blood_type])

    @user.update!(name: params[:name],
                  address: params[:address],
                  blood_type: params[:blood_type])
    render
  end
end
