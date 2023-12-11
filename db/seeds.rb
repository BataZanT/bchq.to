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
  username: "User",
  mail: "user@mail.com",
  password: "1234",
}])

Link.create!([{
    title:"Link normal",
    slug:"45as16jk",
    url:"https://guides.rubyonrails.org/form_helpers.html",
    user_id:1
}])

TempLink.create!([
{
    title:"Link temporal",
    slug:"ag4t93gf",
    url:"https://getbootstrap.com/docs/5.0/forms/overview/",
    expiration_date: "2023-12-25 16:46:00",
    user_id:1
}])

PrivLink.create!([
{
    title:"Link privado",
    slug:"t86r4fg5",
    url:"https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/303",
    password: "1234",
    user_id:1
}])

OneTLink.create!([
{
    title:"Link efimero1",
    slug:"t86r4fp5",
    url:"https://medium.com/@SJTGs/seeding-in-rails-ff6b4e35941b",
    user_id:1
},
{
    title:"Link efimero2",
    slug:"t86rfhr9",
    url:"https://ultimateframedata.com/",
    user_id:1
}])

Access.create!([{
link_id:1,
ip:"127.0.0.1",
date_and_time:"2023-12-11 16:47:59.744197"
},
{
    link_id:1,
    ip:"128.0.0.1",
    date_and_time:"2023-11-11 16:47:59.744197"
},
{
    link_id:1,
    ip:"128.0.0.1",
    date_and_time:"2023-10-11 16:47:59.744197"
},
{
    link_id:1,
    ip:"127.0.0.1",
    date_and_time:"2023-12-11 15:47:59.744197"
},
{
    link_id:1,
    ip:"127.0.0.1",
    date_and_time:"2023-11-11 16:49:59.744197"
},
{
    link_id:2,
    ip:"128.0.0.1",
    date_and_time:"2023-12-05 16:47:59.744197"
},
{
    link_id:2,
    ip:"128.0.0.1",
    date_and_time:"2023-11-03 16:47:59.744197"
},
{
    link_id:2,
    ip:"128.0.0.1",
    date_and_time:"2023-12-06 20:34:25.944405"
},
{
    link_id:3,
    ip:"127.0.0.1",
    date_and_time:"2023-12-07 03:38:52.449167"
},
{
    link_id:3,
    ip:"130.0.0.1",
    date_and_time:"	2023-12-07 17:12:45.225497"
}

])


p "Created #{Book.count} Books"
