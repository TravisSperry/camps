require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :name => "Name",
      :address_1 => "Address 1",
      :address_2 => "Address 2",
      :city => "City",
      :state => "State",
      :zip => 1,
      :telephone => "Telephone",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Address 1/)
    rendered.should match(/Address 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/1/)
    rendered.should match(/Telephone/)
    rendered.should match(/Email/)
  end
end
