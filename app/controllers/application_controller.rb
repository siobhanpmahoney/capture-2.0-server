require 'rest-client'
require 'json'

class ApplicationController < ActionController::API
  before_action :authorized

# controller action will be called twice in in app:
# 1. User#create: when a new user is created
# 2. Auth#create: when a user logs in
  def encode_token(payload) # arg is data identifying user — e.g., DB id and username
    JWT.encode(payload, secret,algorithm)
  end


  # helper function that grabs the token out of from Authorization header

  def auth_header
    # headers: { 'Authorization': 'Bearer <token>' }
    request.headers['Authorization']
    # => 'Bearer <token>'
  end

  def secret
    # Rails.application.secrets.secret_key_base # replaced 'placeholder' with actual secret key
    Rails.application.secrets.secret_key_base
  end


      def algorithm
        'HS256'
      end

  def decoded_token
    if auth_header # auth_header = 'Bearer <token>'
      token = auth_header.split(' ')[1] # => '<token>'
      begin
        JWT.decode(token, secret, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end


  ## helper function determinging if JWT token present
  # called by User#profile
  def current_user
    if decoded_token
      # user_id = User.find_by(id: user_id)
      User.find_by(id: decoded_token[0]["user_id"])

    end
  end

## helper function called by #authorized
  def logged_in?
    !!current_user
  end

# will be utilized by all other Controllers and called before any route may be accessed
  def authorized
    render json: { message: 'Please log in'}, status: :unauthorized unless logged_in?
  end



    ###


    # BEGIN — error definitions

    class AuthError < StandardError
      def initialize(message="Invalid User or password")
        super
      end
    end


    class RequestPasswordResetError < StandardError
      def initalize(message="Username not found. Please contact your ")
        super
      end
    end


    class CreateError < StandardError
      def initialize(message="Error - item not created")
        super
      end
    end


  end

  # BEGIN - former code
  #   def encode_token(payload)
  #     JWT.encode(payload, secret, algorithm)
  #     # JWT.encode(payload,secret,algorithm)
  #   end

  #   def login_user(username, password)
  #     user = User.find_by(username: username)
  #     if user && user.authenticate(password)
  #       user
  #     else
  #       raise AuthError
  #     end
  #   end

  #   def decode_token # removed argument since token will always be found in Auth headers
  #   if auth_header # ensures token exists in header
  #     token = auth_header.split(' ')[1]
  #     begin
  #       JWT.decode(token, secret, true, { algorithm: algorithm })
  #     rescue JWT::DecodeError
  #       nil
  #     end
  #   end
  # end

  # def logged_in?
  #   !!current_user
  # end


  # def authorized
  #   render json: {error: "Must be logged in to view content"} unless logged_in?
  # end

  # def current_user
  #   if decode_token() #ensures Authorization token exists
  #     user_id = decode_token[0]['user_id'] #[{ "user_id"=>"2" }, { "alg"=>"HS256" }]
  #     @user = User.find_by(id: user_id)
  #   else
  #     nil
  #   end
  # end

  # def auth_header
  #     request.headers['Authorization']
  #   end


  #   def secret
  #     # Rails.application.secrets.secret_key_base # replaced 'placeholder' with actual secret key
  #     Rails.application.credentials[:secret_key_base]
  #   end


  #   def algorithm
  #     'HS256'
  #   end
