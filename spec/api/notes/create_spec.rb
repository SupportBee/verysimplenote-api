require "rails_helper"

describe "Create Note API endpoint", type: :request do
  it "creates a note" do
    expect(Note.count).to eq(0)

    params = {
      "note" => {
        "content" => {
          "text" => "Hello!"
        }
      }
    }
    post "/notes", params: params.to_json
    expect(Note.count).to eq(1)

    note = Note.first
    expect(note.content.text).to eq("Hello!")
  end
end
