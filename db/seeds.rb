# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 3.times do |index|

     usuario = User.create!(
   		nombre: "USUARIO#{index}", 
   		email: "USUARIO#{index}@USUARIO.com"
   	)

    6.times do |index2|
    	usuario.products.create(
    		title: "PROD#{index2}",
			description: "Producto de prueba #{index2}",
			deadline: "22/3/2017"
		)
  	end

end
