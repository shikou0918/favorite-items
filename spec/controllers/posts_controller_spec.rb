require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #index' do
    it "@postに正しい値が入ってること" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort { |a, b| b.created_at <=> a.created_at })
    end

    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@postに正しい値が入っていること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "edit.html.hamlに遷移すること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "@postに正しい値が入っていること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "show.html.hamlに遷移すること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end

  describe 'Delete #destroy' do
    it "アイテムの削除" do
      post = create(:post)
      expect do
        delete :destroy, params: { id: post }, xhr: true
      end.to change(Post, :count).by(-1)
    end

    it "destroy.js.hamlに遷移すること" do
      post = create(:post)
      delete :destroy, params: { id: post }, xhr: true
      expect(response).to render_template :destroy
    end
  end
end
