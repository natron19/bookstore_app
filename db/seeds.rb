# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(first_name: 'Agatha', last_name: 'Johnson')
Author.create!(first_name: 'Bob', last_name: 'Christie')
Author.create!(first_name: 'Fed', last_name: 'Fernandez')
Author.create!(first_name: 'Jan', last_name: 'Chase')
Author.create!(first_name: 'Laura', last_name: 'Tomlinson')
Author.create!(first_name: 'Iggy', last_name: 'Croll')


Publisher.create!([{name: 'Wiley'}, {name: 'Addison Wesley'}, 
                  {name: 'Peachpit Press'}, {name: 'Manning'}, 
                  {name: 'No Starch Press'}, {name: 'Apress'}
                  ])

Book.create!(title: 'Gnuplot in Action', isbn: '9999999999999', page_count: 518, price: 49.99, 
                  description: 'A very cool software book', published_at: '2012-01-01', 
                  publisher_id: 3, book_cover: File.open(File.join(Rails.root, 'app/assets/images/gnuplot.jpg')))
