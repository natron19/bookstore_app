require 'rails_helper'

describe Author do 
   it "requires a first name" do 
    author = Fabricate.build(:author, first_name: nil) 
    expect(author).not_to be_valid 
    expect(author.errors[:first_name].any?).to be_truthy
   end 

   it "requires a last name" do 
    author = Fabricate.build(:author, last_name: nil)  
    expect(author).not_to be_valid 
    expect(author.errors[:last_name].any?).to be_truthy
   end 

 describe "#full_name" do 
  it "returns the full name of the author" do 
    author = Fabricate(:author, first_name: "John", last_name: "Bull") 

    expect(author.full_name).to eq("John Bull") 
  end 
 end 

end
