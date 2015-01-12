# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(username: 'shopper', email: 'shopper@simpleshop.test')

Product.create(name: "Amazing Product", price: 9.99)
Product.create(name: "Another Amazing Product", price: 3.99)
Product.create(name: "Special Product", price: 79.99)