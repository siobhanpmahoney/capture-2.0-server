class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create] # all routes protected EXCEPT #create

  def profile
    render json: { user: UserSerializer.new(current_user)}, status: :accepted
  end

  def index
    @users = User.all
    render json: @users
  end



  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id) # token is issued and assigned when new user is created
      render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end





  def show
    @user = User.find(params[:id])
    render json: UserSerializer.new(@user), status: :ok
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      render json: @user
    else
      render json: {error: @user.errors.full_messages}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message:"User Deleted"}
  end



  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, tag_ids: [], app_ids: [], note_ids: [], article_ids: [])
  end
end


## OLD CODE - begin

##  old create:

# def create
#   @user = User.new(user_params)
#   if @user.save
#     @token = encode_token(user_id: @user.id) #issues token when user is registered
#     render json: @user, status: 201
#   else
#     render json: {error:"Error, User not saved"}, status: :unauthorized
#   end
# # else
# #   @user = User.find_by(username: user_params["username"])
# #   render json: @user, status: 201
#   # render json: {user: @user, token: @token}, serialzer: UserSerializer, status: 201
#
# end
