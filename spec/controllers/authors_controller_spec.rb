require 'rails_helper'

describe AuthorsController do 

  describe "GET #index" do 
    it "assigns the authors object to @authors variable" do 
      author1 = Fabricate(:author) 
      author2 = Fabricate(:author) 

      get :index 
      expect(assigns(:authors)).to match_array([author1, author2])
    end 

    it "renders the index template" do 
      get :index 
      expect(response).to render_template :index
    end   
  end 

  describe "GET #show" do 
    let(:author) { Fabricate(:author) }
    it "finds athor with id and assign it to vairable" do 
      get :show, id: author
      expect(assigns(:author)).to eq(author) 
    end 

    it "renders the show template" do 
      get :show, id: author 
      expect(response).to render_template :show
    end 
  end 

  describe "GET #new" do 
    it "assigns a new author to the @author variable" do 
      get :new 
      expect(assigns(:author)).to be_instance_of(Author) 
    end 

    it "renders the new template" do 
      get :new 
      expect(response).to render_template('new')
    end 
  end 

  describe "POST #create" do 
    context "a successful create" do 
      it "saves the new author object" do
        post :create, author: Fabricate.attributes_for(:author) 
        expect(Author.count).to eq(1) 
      end 

      it "redirects to the show action" do 
        post :create, author: Fabricate.attributes_for(:author) 
        expect(response).to redirect_to author_path(Author.first) 
      end 

      it "sets the success flash message" do 
        post :create, author: Fabricate.attributes_for(:author) 
        expect(flash[:success]).to eq("Author has been created.")
      end
    end 

    context "an unsuccessful create" do 

      it "does not save the new author object with invalid inputs" do 
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(Author.count).to eq(0) 
      end

      it "renders the new template" do 
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(response).to render_template :new 
      end 

      it "sets the failure flash message" do 
        post :create, author: Fabricate.attributes_for(:author, first_name: nil) 
        expect(flash[:danger]).to eq("Author has not been created.")
      end
    end 
  end 

  describe "GET #edit" do 
    let(:author) { Fabricate(:author) } 

    it "finds the author with the given id and assigns to @author variable" do 
      get :edit, id: author 
      expect(assigns(:author)).to eq(author) 
    end 

    it "renders the edit template" do 
      get :edit, id: author 
      expect(response).to render_template :edit
    end
  end 

  describe "PUT #update" do 

    context "a successful update" do 
      let(:author) {fabricate(:author)} 

      it "udpates the modified author object" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul') 
        expect(Author.first.first_name).to eq('Paul') 
      end 
      
      it "redirects to the show action" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul') 
        expect(response).to redirect_to author_path(Author.first) 
      end

      it "set the success flash message" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: 'Paul') 
        expect(flash[:success]).to eq('Author has been updated')
      end 
    end 

    context "an unsuccessful udpate" do 
      let(:author) {fabricate(:author, first_name: 'Paul')} 

      it "udpates the modified author object" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: '') 
        expect(Author.first.first_name).to eq('Paul') 
      end 
      
      it "render the editon" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: '') 
        expect(response).to render_template :edit 
      end

      it "set the danger flash message" do 
        put :update, author: Fabricate.attributes_for(:author, first_name: '') 
        expect(flash[:danger]).to eq('Author has not been updated')
      end 
    end  
  end 

  describe "DELETE #destroy" do 
    let(:author) { fabricate(:author) }

    it "delete the author with the given id" do 
      delete :destroy, id: author 
      expect(Author.count).to eq(0)
    end 

    it "sets delete flash message" do 
      delete :destroy, id: author 
      expect(flash[:success]).to eq('Author has been deleted.') 
    end 

    it "redirects to the index page" do 
      delete :destroy, id: author 
      author(response).to redirect_to authors_path 
    end 
  end
end 