class Api::V1::AppsController < ApplicationController
  skip_before_action :authorized, only: [:index]


  def index
    # @apps = App.all
    @apps = current_user.apps
    render json: @apps
  end

  def create
    @app = App.find_or_create_by(app_params)
    if @app
      render json: AppSerializer.new(app: @app), status: 201
    else
      byebug
      render json: {error: @app.errors.full_messages}, status: 500
    end
  end


  def show
    @app = App.find(params[:id])
    render json: @app, status: :ok
  end


  def update

    @app = App.find(params[:id])
    @app.update(app_params)
    if @app.save
      render json: @app
    else
      render json: {error: @app.errors.full_messages}
    end
  end

  def destroy
    @app = App.find(params[:id])
    @app.destroy
    render json: @app
  end



  private

  def app_params
    params.require(:app).permit(:user_id, :job_id, :date_saved, :date_applied, :cover_letter, interview_ids: [])
  end
end
