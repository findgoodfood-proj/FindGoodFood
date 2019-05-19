require "rails_helper"

RSpec.describe RatingsController, type: :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "/rate/1").to route_to("ratings#new", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rate/1").to route_to("ratings#create", :id => "1")
    end

  end
end
