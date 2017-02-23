require "rails_helper"

describe "Destination API" do
  before do
    @destination_1 = Destination.create(name: "Denver",
                       zip: "80210" ,
                       description: "Mile High City",
                       image_url: "/" )
   @destination_2 = Destination.create(name: "Las Vegas",
                      zip: "9000" ,
                      description: "Vegas!",
                      image_url: "/" )
  end

  it "can get one destination" do
    get "/api/v1/destinations/#{@destination_1.id}"

    destination = JSON.parse(response.body)

    expect(destination["name"]).to eq("Denver")
    expect(destination["zip"]).to eq("80210")
    expect(destination["description"]).to eq("Mile High City")
    expect(destination["image_url"]).to eq("/")
  end

  it "can get all destinations" do
    get "/api/v1/destinations"

    destinations = JSON.parse(response.body)

    destinations.each do |destination|
      expect(destination).to have_key("name")
      expect(destination).to have_key("zip")
      expect(destination).to have_key("description")
    end
  end

  it "can create destination" do
    attributes = { name: "Toledo",
                   zip: "1000",
                   description: "It's actually very lovely this time of year"}

    post "/api/v1/destinations", destination: attributes

    expect(Destination.count).to eq(3)
  end

  it "can edit destination" do
    attributes = { name: "Toledo",
                   zip: "1000",
                   description: "It's actually very lovely this time of year"}

    put "/api/v1/destinations/#{@destination_1.id}", destination: attributes

    expect(Destination.count).to eq(2)
    expect(Destination.pluck(:name)).not_to include("Denver")
  end

  it "can delete destination" do
    delete "/api/v1/destinations/#{@destination_1.id}"

    expect(Destination.count).to eq(1)
  end
end
