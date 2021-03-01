class NotesController < ApplicationController
  before_action :set_response_format_to_json

  def create
    request_hash = JSON.parse(request.body.read)
    params.merge!(request_hash)

    @note = Note.new
    @note.content = Content.new
    @note.content.text = params["note"]["content"]["text"]
    @note.save!
  end

  def index
    @notes = Note.order(created_at: :desc)
    @notes = if params["label_names"]
      @notes.joins(:labels).where("labels.name" => params["label_names"])
    elsif params["label_names_not"]
      @notes.left_outer_joins(:labels).where.not("labels.name" => params["label_names_not"]).or(Note.where("labels.name" => nil))
    else
      @notes.all
    end
  end

  private

  def set_response_format_to_json
    request.format = :json
  end
end
