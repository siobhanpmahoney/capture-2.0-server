class Api::V1::CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render json: @companies
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: 201
    else
      render json: {error: @company.errors.full_messages}, status: 500
    end
  end


  def show
    @company = Company.find(params[:id])
    render json: @company, status: :ok
  end


  def update

    @company = Company.find(params[:id])
    @company.update(company_params)
    if @company.save
      render json: @company
    else
      render json: {error: @company.errors.full_messages}
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    render json: {message:"Company Deleted"}
  end



  private

  def company_params
    params.require(:company).permit(:name, :description, :size, :locations, :industries, :twitter, :muse_id, job_ids: [])
  end
end
