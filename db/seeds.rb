# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create! :name => 'Javier Jaimes', :email => 'javierjaimes@gmail.com', :password => '12345678', :password_confirmation => '12345678'
story = Story.create! :body => 'En corferias se lleva a cabo el #edayco, para hablar sobre ecommerce, emprendimiento y mas, en un rato mas acontecimientos sobre el #ecommerceday en Bogota. Por ahora los invito a que sigan leyendo lo que sucede en corferias.', :user_id => user.id
