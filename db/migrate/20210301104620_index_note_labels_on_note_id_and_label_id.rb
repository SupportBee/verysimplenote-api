class IndexNoteLabelsOnNoteIdAndLabelId < ActiveRecord::Migration[6.1]
  def change
    add_index "note_labels", ["note_id", "label_id"], unique: true
  end
end
