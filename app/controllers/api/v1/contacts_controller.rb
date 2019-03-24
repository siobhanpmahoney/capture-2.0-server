class Api::V1::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact, status: 201
    else
      render json: {error: @contact.errors.full_messages}, status: 500
    end
  end


  def show
    @contact = Contact.find(params[:id])
    render json: @contact, status: :ok
  end


  def update

    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: {error: @contact.errors.full_messages}
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: {message:"Contact Deleted"}
  end



  private

  def contact_params
    params.require(:contact).permit(:name, :title, :email, :interview_id)
  end
end
