class Api::V1::CompaniesController < ApplicationController

  def index
    @companies = Company.all
    render json: @companies
  end

  def create
    if Company.find_by(muse_id: company_params["muse_id"])
      @company = Company.find_by(muse_id: company_params["muse_id"])
    else
      @company = Company.create(company_params)
    end

    if @company
      if !current_user.companies.find {|c| c.muse_id == @company.muse_id}
        current_user.companies << @company
      end

      render json: CompanySerializer.new(@company), status: 201

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
    params.require(:company).permit(:name, :description, :size, :locations, :industries, :twitter, :image, :logo_image, :muse_landing_page, :muse_id, job_ids: [], companies_ids: [])
  end
end
