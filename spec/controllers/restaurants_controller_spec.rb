require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  let(:valid_attributes) {
    {id: 1, restaurant: {name: "Lost Dog", address: "a", phone_number: "123-4567", description: "desc"}}
  }

  let(:valid_session) { {user_id: 1} }
  
  let(:user1) {instance_double('User', id: 1, email: 'a@web.com')}

  describe "GET #index" do
    context "with valid params" do
      it "shows all Restaurants" do
        allow(User).to receive(:find).and_return(user1)
        get :index, valid_attributes, valid_session
        expect(response).to render_template(:index)
      end
    end
  end
  
  describe "GET #show" do
    context "with valid params" do
      it "shows a Restaurant" do
        allow(User).to receive(:find).and_return(user1)
        restaurant = Restaurant.create! name: "Lost Dog", address: "a", phone_number: "123-4567", description: "desc"
        get :show, valid_attributes, valid_session
        expect(response).to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Restaurant" do
        allow(User).to receive(:find).and_return(user1)
        post :create, valid_attributes, valid_session
        expect(response).to redirect_to('/restaurants/1')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {id: 1, restaurant_id: {"1" => "a"}, food: {name: "pasta", price: 2, tags: "b"}}
      }

      it "updates the requested restaurant" do
        allow(User).to receive(:find).and_return(user1)
        restaurant = Restaurant.create! name: "Lost Dog", address: "a", phone_number: "123-4567", description: "desc"
        put :update, {:id => 1, restaurant: {name: "Lost Dog", address: "a", phone_number: "123-4567", description: "changed description"}}, valid_session
        restaurant.reload
        expect(restaurant.description).to eq("changed description")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested restaurant" do
      allow(User).to receive(:find).and_return(user1)
      restaurant = Restaurant.create! name: "Lost Dog", address: "a", phone_number: "123-4567", description: "desc", user_id: 1
      expect {
        delete :destroy, {:id => 1}, valid_session
      }.to change(Restaurant, :count).by(-1)
    end
  end
end
