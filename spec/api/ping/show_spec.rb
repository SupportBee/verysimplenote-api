require "rails_helper"

describe "Fetch Ping API endpoint" do
  it "returns 'pong'" do
    get "/ping"
    expect(response.body).to eq("pong")
  end
end
