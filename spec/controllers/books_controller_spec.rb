require 'rails_helper' 

describe BooksController do 

  describe "GET #index" do 
    it "assigns the books object to @books variable" do 
      book1 = Fabricate(:book) 
      book2 = Fabricate(:book) 

      get :index 
      expect(assigns(:books)).to match_array([book1, book2])
    end 

    it "renders the index template" do 
      get :index 
      expect(response).to render_template :index
    end   
  end 

  describe "GET #show" do 
    let(:book) { Fabricate(:book) }
    it "finds athor with id and assign it to vairable" do 
      get :show, id: book
      expect(assigns(:book)).to eq(book) 
    end 

    it "renders the show template" do 
      get :show, id: book 
      expect(response).to render_template :show
    end 
  end 

  describe "GET #new" do 
    it "assigns a new book to the @book variable" do 
      get :new 
      expect(assigns(:book)).to be_instance_of(book) 
    end 

    it "renders the new template" do 
      get :new 
      expect(response).to render_template('new')
    end 
  end 

  describe "POST #create" do 
    context "a successful create" do 
      it "saves the new book object" do
        post :create, book: Fabricate.attributes_for(:book) 
        expect(book.count).to eq(1) 
      end 

      it "redirects to the show action" do 
        post :create, book: Fabricate.attributes_for(:book) 
        expect(response).to redirect_to book_path(book.first) 
      end 

      it "sets the success flash message" do 
        post :create, book: Fabricate.attributes_for(:book) 
        expect(flash[:success]).to eq("book has been created.")
      end
    end 

    context "an unsuccessful create" do 

      it "does not save the new book object with invalid inputs" do 
        post :create, book: Fabricate.attributes_for(:book, first_name: nil)
        expect(book.count).to eq(0) 
      end

      it "renders the new template" do 
        post :create, book: Fabricate.attributes_for(:book, first_name: nil)
        expect(response).to render_template :new 
      end 

      it "sets the failure flash message" do 
        post :create, book: Fabricate.attributes_for(:book, first_name: nil) 
        expect(flash[:danger]).to eq("book has not been created.")
      end
    end 
  end 

  describe "GET #edit" do 
    let(:book) { Fabricate(:book) } 

    it "finds the book with the given id and assigns to @book variable" do 
      get :edit, id: book 
      expect(assigns(:book)).to eq(book) 
    end 

    it "renders the edit template" do 
      get :edit, id: book 
      expect(response).to render_template :edit
    end
  end 

  describe "PUT #update" do 

    context "a successful update" do 
      let(:book) {fabricate(:book)} 

      it "udpates the modified book object" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: 'Paul') 
        expect(book.first.first_name).to eq('Paul') 
      end 
      
      it "redirects to the show action" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: 'Paul') 
        expect(response).to redirect_to book_path(book.first) 
      end

      it "set the success flash message" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: 'Paul') 
        expect(flash[:success]).to eq('book has been updated')
      end 
    end 

    context "an unsuccessful udpate" do 
      let(:book) {fabricate(:book, first_name: 'Paul')} 

      it "udpates the modified book object" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: '') 
        expect(book.first.first_name).to eq('Paul') 
      end 
      
      it "render the editon" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: '') 
        expect(response).to render_template :edit 
      end

      it "set the danger flash message" do 
        put :update, book: Fabricate.attributes_for(:book, first_name: '') 
        expect(flash[:danger]).to eq('book has not been updated')
      end 
    end  
  end 

  describe "DELETE #destroy" do 
    let(:book) { fabricate(:book) }

    it "delete the book with the given id" do 
      delete :destroy, id: book 
      expect(book.count).to eq(0)
    end 

    it "sets delete flash message" do 
      delete :destroy, id: book 
      expect(flash[:success]).to eq('book has been deleted.') 
    end 

    it "redirects to the index page" do 
      delete :destroy, id: book 
      book(response).to redirect_to books_path 
    end 
  end
end 