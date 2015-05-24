class Author < ActiveRecord::Base
  validates :first_name, :last_name, presence: true 
  has_many :publications 
  has_many :books, through: :publications 

  validates :first_name, presence: true
  validates :last_name, presence: true 

  def full_name 
    "#{first_name} #{last_name}"
  end 
end
