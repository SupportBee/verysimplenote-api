require "rails_helper"

describe Note do
  describe "#has_label?" do
    context "note has the given label" do
      it "returns true" do
        content = FactoryBot.create :content
        note = FactoryBot.create :note, content: content
        note.add_label("trash")
        expect(note.has_label?("trash")).to eq(true)
      end
    end

    context "note doesn't have the given label" do
      it "returns false" do
        content = FactoryBot.create :content
        note = FactoryBot.create :note, content: content
        expect(note.has_label?("trash")).to eq(false)
      end
    end
  end
end
