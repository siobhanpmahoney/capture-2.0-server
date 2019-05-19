class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: @job, status: 201
    else
      render json: {error: @job.errors.full_messages}, status: 500
    end
  end


  def show
    @job = Job.find(params[:id])
    render json: @job, status: :ok
  end


  def update

    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      render json: @job
    else
      render json: {error: @job.errors.full_messages}
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    render json: {message:"Job Deleted"}
  end



  private

  def job_params
    params.require(:job).permit(:contents, :name, :publication_date, :muse_id, :locations, :categories, :levels, :landing_page, :company_id, :app_id)
  end
end
