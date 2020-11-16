# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  User.find_or_create_by(email: 'admin@mail.com', type: "Admin").update(password: "123456")
  User.find_or_create_by(email: 'seller@mail.com', type: "Seller").update(password: "123456")
  User.find_or_create_by(email: 'buyer@mail.com', type: "Buyer").update(password: "123456")
