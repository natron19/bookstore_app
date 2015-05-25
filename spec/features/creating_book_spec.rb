require 'rails_helper' 

feature 'Creating Books' do 
  let!(:peachpit) { Fabricate(:publiser, name: "Peachpit Press") } 
  let!(:author1) { Fabricate(:author) } 
  let!(:author2) { Fabricate(:author) } 

  scenario 'create a valid book' do 
    visit root_path 

    click_link 'Books', except: false 
    click_link 'Add New Book' 

    fill_in 'Title', with: 'Javascript' 
    fill_in 'Isbn', with: '9780321772978'
    fill_in 'Page count', with: '518'
    fill_in 'Price', with: 34.99
    fill_in 'Description', with: 'Learn Javascript the quick and easy way.' 
    fill_in 'Published at', with: '2012-01-01' 

    attach_file 'Book cover', 'app/assets/images/itext.jpg' 
    select 'Peachpit Press', from: 'Publisher' 

    check author1.full_name 
    check author2.full_natme

    click_button 'Create Book' 

    expect(page).to have_content('Book has been created.')  

  end 

end 