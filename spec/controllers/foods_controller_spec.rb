require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe FoodsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Food. As you add validations to Food, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {id: 1, restaurant_id: {"1" => "a"}, food: {name: "pasta", price: 1, tags: "a"}}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoodsController. Be sure to keep this updated too.
  let(:valid_session) { {user_id: 1} }
  
  let(:user1) {instance_double('User', id: 1, email: 'a@web.com')}
  let(:restaurant1) {instance_double('Restaurant', id: 1, name: "restaurant", user_id: 1)}

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Food" do
        allow(User).to receive(:find).and_return(user1)
        allow(Restaurant).to receive(:find).and_return(restaurant1)
        post :create, valid_attributes, valid_session
        expect(response).to redirect_to(restaurant_path(restaurant1))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {id: 1, restaurant_id: {"1" => "a"}, food: {name: "pasta", price: 2, tags: "b"}}
      }

      it "updates the requested food" do
        allow(User).to receive(:find).and_return(user1)
        allow(Restaurant).to receive(:find).and_return(restaurant1)
        food = Food.create! name: "pasta", price: 3, tags: "a" 
        put :update, {:id => 1, food: {name: "pasta", price: 2, tags: "b"}}, valid_session
        food.reload
        expect(food.price).to equal(2)
        # skip("Add assertions for updated state")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested food" do
      allow(User).to receive(:find).and_return(user1)
      allow(Restaurant).to receive(:find).and_return(restaurant1)
      food = Food.create! name: "pasta", price: 3, tags: "a" 
      expect {
        delete :destroy, {:id => 1}, valid_session
      }.to change(Food, :count).by(-1)
    end
  end

end
