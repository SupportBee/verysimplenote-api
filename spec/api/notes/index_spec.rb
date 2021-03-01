require "rails_helper"

describe "Fetch Notes API endpoint", type: :request do
  it "returns notes" do
    create_note_with_text("Hello!")
    create_note_with_text("Hello again!")
    get "/notes"
    note_hashes = response_hash["notes"]
    expect(note_hashes.size).to eq(2)
    expect(note_hashes[0]["content"]["text"]).to eq("Hello again!")
    expect(note_hashes[1]["content"]["text"]).to eq("Hello!")
  end

  context "query param 'label_names_not' is ['trash']" do
    it "returns notes which aren't trashed" do
      note1 = create_note_with_text("Hello!")
      note2 = create_note_with_text("Hello again!")
      note2.mark_as_trash

      get "/notes", params: { "label_names_not" => ["trash"] }
      note_hashes = response_hash["notes"]
      expect(note_hashes.size).to eq(1)
      expect(note_hashes[0]["content"]["text"]).to eq("Hello!")
    end
  end

  context "query param 'label_names is ['trash']" do
    it "returns trashed notes" do
      note1 = create_note_with_text("Hello!")
      note2 = create_note_with_text("Hello again!")
      note2.mark_as_trash

      get "/notes", params: { "label_names" => ["trash"] }
      note_hashes = response_hash["notes"]
      expect(note_hashes.size).to eq(1)
      expect(note_hashes[0]["content"]["text"]).to eq("Hello again!")
    end
  end
end
