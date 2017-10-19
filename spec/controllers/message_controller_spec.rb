require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  # let(:group) { create(:group) }
  let(:group) { user.groups.first}
  # let(:groups) { create(:groups) }
  let(:message) { create(:message) }

  describe 'GET #index' do
    before do
      login_user user

    end

    it "assigns the requested contact to @group" do
      # @group = user.groups.first
      # binding.pry
      get :index, params: { group_id: group.id }
      # groups = user.groups
      expect(assigns(:group)).to eq group
    end

    it "assigns the requested contact to @message" do
      # message = Message.new
      get :index, params: { group_id: group }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "assigns the requested contact to @groups " do
      get :index, params: { group_id: group.id }
      groups = user.groups
      # binding.pry
      expect(assigns(:groups)).to eq groups
    end

    it "renders the :index template" do
      get :index, params: { group_id: group.id }
      # message = index(:messages)
      # get :index, params: { group_id: group }
      expect(response).to render_template :index
    end

  end

  describe 'GET #index' do
    it "renders the :index template" do
    get :index, params: { group_id: group.id }
    expect(response).to redirect_to new_user_session_path
    end

  end

  describe 'POST #create' do
    before do
      login_user user
    end

    it "assigns the requested contact to @message" do
    expect{ build(:message) }.to change{ Message.count }.by(1)
    end

    it "renders the :create template" do
    post :create, params: { group_id: group, message: attributes_for(:message) }
    expect(response).to redirect_to group_messages_path(group)
    end

    it "assigns the requested contact to @message" do
    expect do
    post :create, params: { group_id: group, message: attributes_for(:message, text:nil, image:nil) }
      end.not_to change(Message, :count)
    end

    it "renders the :create template" do
    post :create, params: { group_id: group, message: attributes_for(:message) }
    expect(response).to redirect_to group_messages_path(group)
    end
  end

  describe 'POST #create' do
    it "renders the :create template" do
    get :create, params: { group_id: group.id }
    expect(response).to redirect_to new_user_session_path
    end
  end
end
