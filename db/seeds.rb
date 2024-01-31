# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!([{
  id: 1,  
  username: "User",
  mail: "user@mail.com",
  password: "1234",
}])
30.times do |i|
Link.create!([{
    title:"Link normal#{i}",
    slug: i.to_s + SecureRandom.hex[0..6],
    url:"https://ttps-ruby.github.io/#/#{i}",
    user_id:1
}])

TempLink.create!([
{
    title:"Link temporal#{i}",
    slug: (i+30).to_s + SecureRandom.hex[0..6],
    url:"https://ttps-ruby.github.io/#/#{i}",
    expiration_date: Date.today+rand(1..1000),
    user_id:1
}])

PrivLink.create!([
{
    title:"Link privado#{i}",
    slug: (i+60).to_s + SecureRandom.hex[0..6],
    url:"https://ttps-ruby.github.io/#/#{i}",
    password: "1234",
    user_id:1
}])

OneTLink.create!([
{
    title:"Link efimero#{i}",
    slug:(i+90).to_s + SecureRandom.hex[0..6],
    url:"https://ttps-ruby.github.io/#/#{i}",
    user_id:1
}])
20.times do
Access.create!([{
    link_id:rand(1..Link.all.length),
    ip:"#{rand(0..255)}.#{rand(0..255)}.#{rand(0..255)}.#{rand(0..255)}",
    date_and_time: Date.today-rand(1000)
}])

end
end