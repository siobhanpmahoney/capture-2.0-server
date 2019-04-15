class Api::V1::TagNotesController < ApplicationController
  def index
    @tag_tag_notes = TagNote.all
    render json: @tag_tag_notes
  end

  def create
    @tag_note = TagNote.new(tag_note_params)
    if @tag_note.save
      render json: @tag_note, status: 201
    else
      render json: {error: @tag_note.errors.full_messages}, status: 500
    end
  end


  def show
    @tag_note = TagNote.find(params[:id])
    render json: @tag_note, status: :ok
  end


  def update

    @tag_note = TagNote.find(params[:id])
    @tag_note.update(tag_note_params)
    if @tag_note.save
      render json: @tag_note
    else
      render json: {error: @tag_note.errors.full_messages}
    end
  end

  def destroy
    @tag_note = TagNote.find(params[:id])
    @tag_note.destroy
    render json: {message:"Note Deleted"}
  end



  private

  def tag_note_params
    params.require(:tag_note).permit(:tag_id, :note_id, :user_id)
  end
end
