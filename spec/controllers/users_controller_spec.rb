require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #show' do
    it "@userに正しい値が入っていること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "show.html.hamlに遷移すること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end 
  end
end

