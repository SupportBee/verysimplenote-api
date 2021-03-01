require "rails_helper"

describe "Create Note Label API endpoint" do
  it "adds the given label to the given note" do
    note = FactoryBot.create :note
    label_name = "trash"
    post "/notes/#{note.id}/labels/#{label_name}"
  end
end
