require 'rails_helper'

RSpec.describe MembersController, :type => :controller do

  let(:valid_attributes) {
    { first_name: 'John', last_name: 'Smith', membership_number: 1234 }
  }

  let(:invalid_attributes) {
    { first_name: 'John', last_name: 'Smith', membership_number: 'number' }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all members as @members" do
      member = Member.create! valid_attributes
      get :index, {}, valid_session
      assigns(:members).should == [member]
    end
  end

  describe "GET show" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :show, {:id => member.to_param}, valid_session
      assigns(:member).should == member
    end
  end

  describe "GET new" do
    it "assigns a new member as @member" do
      get :new, {}, valid_session
      assigns(:member).should be_a_new(Member)
    end
  end

  describe "GET edit" do
    it "assigns the requested member as @member" do
      member = Member.create! valid_attributes
      get :edit, {:id => member.to_param}, valid_session
      assigns(:member).should == member
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Member" do
        expect {
          post :create, {:member => valid_attributes}, valid_session
        }.to change(Member, :count).by(1)
      end

      it "assigns a newly created member as @member" do
        post :create, {:member => valid_attributes}, valid_session
        assigns(:member).should be_a(Member)
        assigns(:member).should be_persisted
      end

      it "redirects to the created member" do
        post :create, {:member => valid_attributes}, valid_session
        response.should redirect_to(Member.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved member as @member" do
        post :create, {:member => invalid_attributes}, valid_session
        assigns(:member).should be_a_new(Member)
      end

      it "re-renders the 'new' template" do
        post :create, {:member => invalid_attributes}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { first_name: 'John', last_name: 'Smith', membership_number: 5678 }
      }

      it "updates the requested member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => new_attributes}, valid_session
        member.reload
        member.membership_number.should == 5678
      end

      it "assigns the requested member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        assigns(:member).should == member
      end

      it "redirects to the member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => valid_attributes}, valid_session
        response.should redirect_to(member)
      end
    end

    describe "with invalid params" do
      it "assigns the member as @member" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        assigns(:member).should == member
      end

      it "re-renders the 'edit' template" do
        member = Member.create! valid_attributes
        put :update, {:id => member.to_param, :member => invalid_attributes}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested member" do
      member = Member.create! valid_attributes
      expect {
        delete :destroy, {:id => member.to_param}, valid_session
      }.to change(Member, :count).by(-1)
    end

    it "redirects to the members list" do
      member = Member.create! valid_attributes
      delete :destroy, {:id => member.to_param}, valid_session
      response.should redirect_to(members_url)
    end
  end

end
