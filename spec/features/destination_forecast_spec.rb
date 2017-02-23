require 'rails_helper'

describe 'As a user, when I visit "/"' do
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
  it "and I click on destination, I should be on destination show page" do
    visit root_path

    first(:link, 'Show').click

    expect(current_path).to eq(destination_path(@destination_1.id))
  end

  it "I should see the destination information" do
    visit destination_path(@destination_1.id)

    expect(page).to have_content(@destination_1.name)
    expect(page).to have_content(@destination_1.zip)
    expect(page).to have_content(@destination_1.description)
    expect(page).to have_content("Forecast for #{@destination_1.name}")
  end

  it "I should see the weather forecast for that destination" do
    visit destination_path(@destination_1.id)

    expect(page).to have_selector('.day', count: 10)

    expect(page).to have_content('Wednesday')
    expect(page).to have_content('2')
    expect(page).to have_content('22')
    expect(page).to have_content('57')
    expect(page).to have_content('31')
    expect(page).to have_content('Partly Cloudy')
  end
end
