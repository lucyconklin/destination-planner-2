require 'rails_helper'

describe 'As a user, when I visit "/"' do
  before do
    @destination_1 = { name: "Denver",
                       zip: "80210" ,
                       description: "Mile High City",
                       image_url: "/" }
   @destination_2 = { name: "Las Vegas",
                      zip: "80210" ,
                      description: "Mile High City",
                      image_url: "/" }
  end
  it "and I click on destination, I should be on destination show page" do
    visit root_path

    click_on(link_or_button: destination_path(@destination_1))

    expect(current_path).to eq(destination_path(@destination_1)
  end

  xit "I should see the destination information" do

  end

  xit "I should see the weather forecast for that destination" do

  end
end
