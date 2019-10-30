require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'CREATE #create' do
    before do
      category = create(:category)
      user = create(:user)
      address = create(:address, user: user)
      sign_in(user)
      @item = create(:item, user: user, category: category, saler: user)
    end

    it "itemが保存された場合indexにリダイレクトされること" do
      post :create, params: {id: @item.id}
      expect(response).to render_template :index
    end
  end
end