require 'rails_helper' 

describe User do 

  it "requires a first name" do 
    john = User.new(email: 'john@example.com', password: 'password', first_name: "", last_name: "Doe")
    expect(john).not_to be_valid 
    expect(john.errors[:first_name].any?).to be_truthy 
  end 

  it "requires a last name" do 
    john = User.new(email: 'john@example.com', password: 'password', first_name: "John", last_name: "")
    expect(john).not_to be_valid 
    expect(john.errors[:last_name].any?).to be_truthy 
  end 

  it "requires a email" do 
    john = User.new(email: '', password: 'password', first_name: 'John', last_name: "Doe")
    expect(john).not_to be_valid 
    expect(john.errors[:email].any?).to be_truthy 
  end 

  it "requires a password" do 
    john = User.new(email: 'john@example.com', password: '', first_name: "John", last_name: "Doe")
    expect(john).not_to be_valid 
    expect(john.errors[:password].any?).to be_truthy 
  end 

  it "requires a #full_name" do 
    john = User.create(email: 'john@example.com', password: 'password', first_name: "John", last_name: "Doe")
    
    expect(john.full_name).to eq("John Doe")
  end   

end 