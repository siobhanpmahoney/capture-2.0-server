class Api::V1::CompaniesController < ApplicationController

  def index
    @companies = Company.all
    render json: @companies
  end

  def create
    puts "\n"
    puts "\n"
    puts "in Company#create"
    puts "\n"
    puts "current user?"
    puts current_user
    puts "\n"
    puts "params"
    puts params
    puts "\n"
    puts "\n"
    @company = Company.new(company_params)
    puts "\n"
    puts "\n"
    if @company.save
      puts "company saved"
      puts @company
      puts "\n"
      puts "\n"
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
    params.require(:company).permit(:name, :description, :size, :locations, :industries, :twitter, :image, :logo_image, :muse_landing_page, :muse_id, job_ids: [])
  end
end
