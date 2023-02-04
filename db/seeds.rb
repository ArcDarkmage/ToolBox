# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# clear all tools data
Tool.destroy_all

# clear all user data
User.destroy_all

puts 'Creating users'
nilce = User.create!(
  first_name: 'Nilce',
  last_name: 'Moscone',
  apartment: 86,
  phone_number: '11 99444-5567',
  email: 'nilcemayumi@gmail.com',
  password: '123456'
)
marcia = User.create!(
  first_name: 'Márcia',
  last_name: 'Quintella',
  apartment: 18,
  phone_number: '21 97698-5498',
  email: 'marciaquintella@gmail.com',
  password: '123456'
)
gabs = User.create!(
  first_name: 'Gabriel',
  last_name: 'Martins',
  apartment: 38,
  phone_number: '11 97650-4568',
  email: 'gabriel.st.martins@gmail.com',
  password: '123456'
)
cedric = User.create!(
  first_name: 'Cedric',
  last_name: 'Wamba',
  apartment: 107,
  phone_number: '11 95113-8111',
  email: 'cedricwamba@gmail.com',
  password: '123456'
)

puts 'Creating tools'

Tool.create!(
  name: 'Martelo',
  details: 'martelo com ótimo acabamento!',
  price_cents: '1000',
  user_id: nilce.id
)

Tool.create!(
  name: 'Escada',
  details: 'Escada articulada que vira andaime',
  price_cents: '2500',
  user_id: nilce.id
)

Tool.create!(
  name: 'tico-tico',
  details: 'semi-novo, ótimo para aquele projeto DIY',
  price_cents: '1500',
  user_id: marcia.id
)

Tool.create!(
  name: 'parafusadeira',
  details: 'ótima para facilitar a montagem de qualquer móvel',
  price_cents: '2000',
  user_id: marcia.id
)

Tool.create!(
  name: 'furadeira',
  details: 'furadeira de alto impacto, diversos tamanhos de brocas',
  price_cents: '2500',
  user_id: gabs.id
)

Tool.create!(
  name: 'serra de fita',
  details: 'para aqueles que estão fazendo um projeto mais profissional',
  price_cents: '5000',
  user_id: gabs.id
)

Tool.create!(
  name: 'kit jardinagem',
  details: 'diversas ferramentas de jardinagem para cuidar de suas plantas',
  price_cents: '2000',
  user_id: cedric.id
)

Tool.create!(
  name: 'conjunto de ferramentas',
  details: 'uma caixa com mais de 100 ferramentas básicas para qualquer reparo',
  price_cents: 3000,
  user_id: cedric.id
)
