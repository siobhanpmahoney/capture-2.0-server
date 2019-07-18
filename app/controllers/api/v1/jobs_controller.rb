class Api::V1::JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def create
    # check if company exists

    # check if params include contents

    # if yes, save directly with params sent with request
    # if not, make call to the Muse API to get contents
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"
    puts "params[:job][:muse_id]"
    puts params[:job][:muse_id]
    puts "\n"
    puts "\n"
    puts "Job.find_by(muse_id: params[:job][:muse_id])"
    puts Job.find_by(muse_id: params[:job][:muse_id])
    puts "\n"
    puts "\n"
    puts "\n"
    puts "\n"


    if !Job.find_by(muse_id: params[:job][:muse_id])
      @job = Job.create(job_params)
    else
      @job = Job.find_by(muse_id: params[:job][:muse_id])
    end
    puts "new job"
    puts @job

    if @job
    #   if !current_user.jobs.find(@job.id)
    #     current_user.jobs << @job
    #   end


      render json: JobSerializer.new(@job), status: 201
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
    params.require(:job).permit(:contents, :name, :publication_date, :muse_id, :locations, :categories, :levels, :landing_page, :company_muse_id, :company_id, :company_name, apps_ids: [])
  end
end
