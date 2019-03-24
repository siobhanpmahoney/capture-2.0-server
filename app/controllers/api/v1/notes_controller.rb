class Api::V1::NotesController < ApplicationController
  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note, status: 201
    else
      render json: {error: @note.errors.full_messages}, status: 500
    end
  end


  def show
    @note = Note.find(params[:id])
    render json: @note, status: :ok
  end


  def update

    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      render json: @note
    else
      render json: {error: @note.errors.full_messages}
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message:"Note Deleted"}
  end



  private

  def note_params
    params.require(:note).permit(:title, :content, tags: [])
  end
end
