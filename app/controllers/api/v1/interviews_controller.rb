class Api::V1::InterviewsController < ApplicationController
  def index
    @interviews = Interview.all
    render json: @interviews
  end

  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      render json: @interview, status: 201
    else
      render json: {error: @interview.errors.full_messages}, status: 500
    end
  end


  def show
    @interview = Interview.find(params[:id])
    render json: @interview, status: :ok
  end


  def update

    @interview = Interview.find(params[:id])
    @interview.update(interview_params)
    if @interview.save
      render json: @interview
    else
      render json: {error: @interview.errors.full_messages}
    end
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    render json: {message:"Interview Deleted"}
  end



  private

  def interview_params
    params.require(:interview).permit(:app_id, :type, :date, :thank_you_note, contact_ids: [])
  end
end
