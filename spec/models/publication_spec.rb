require 'rails_helper' 

describe Publication do 

  id { should belong_to(:author) } 
  it { should belong_to(:book) } 
end 
