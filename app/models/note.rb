class Note < ApplicationRecord
  has_one :content, as: :parent
  
  has_many :note_labels, dependent: :destroy
  has_many :labels, through: :note_labels

  def add_label(label_name)
    label = Label.where(name: label_name).first
    note_label = note_labels.build
    note_label.label = label
    note_label.save!
  end

  def mark_as_trash
    add_label("trash")
  end
end
