require 'rails_helper'

RSpec.describe HomepageController, type: :controller do

  let(:valid_session) { {user_id: 1} }
  
  let(:user1) {instance_double('User', id: 1, email: 'a@web.com')}

  describe "GET #home" do
    context "with valid session" do
      it "redirects to Home" do
        allow(User).to receive(:find).and_return(user1)
        get :home, {}, valid_session
        expect(response).to render_template(:home)
      end
    end
  end
end
