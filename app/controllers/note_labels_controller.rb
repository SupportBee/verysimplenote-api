class NoteLabelsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    note.add_label(label_name) unless note.has_label?(label_name)

    head 201
  end

  private

  def label_name
    params["label_name"]
  end

  def note
    Note.find(params["note_id"])
  end
end
