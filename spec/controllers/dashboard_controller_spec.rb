require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

  let(:valid_session) { {user_id: 1} }
  
  let(:user1) {instance_double('User', id: 1, email: 'a@web.com')}

  describe "GET #index" do
    context "with valid session" do
      it "redirects to index" do
        allow(User).to receive(:find).and_return(user1)
        get :index, {}, valid_session
        expect(response).to render_template(:index)
      end
    end
  end
end
