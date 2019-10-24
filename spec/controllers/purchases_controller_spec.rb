require 'rails_helper'

describe PurchasesController, type: :controller do
  describe 'GET #new' do
    it "renders the :new template" do
      user = create(:user)
      address = create(:address, user: user)
      sign_in(user)
      item = create(:item, user: user)
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it "match the :create purchase" do
      user = create(:user)
      address = create(:address, user: user)
      sign_in(user)
      item = create(:item, user: user)
      post :create,params: {item_id: item.id}
      expect(response).to render_template :new
    end
  end
end