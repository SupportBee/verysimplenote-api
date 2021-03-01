class CreateNoteLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :note_labels do |t|
      t.references :note
      t.references :label

      t.timestamps
    end
  end
end
