User.create! name: "Framgia",
  email: "1@gmail.com",
  password: "123123",
  is_admin: true

15.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123123"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end

Genre.create! name: "Nhac Tre RnB",
  description: "The loai nhac danh cho gioi tre voi tiet tau tre trung soi dong."

Genre.create! name: "Nhac Khong Loi",
  description: "The loai nhac khong co loi, chi thuan la giai dieu."

Genre.create! name: "Nhac Nuoc Ngoai",
  description: "The loai nhac cua cac nuoc tren the gioi."

Genre.create! name: "Nhac Cai Luong",
  description: "The loai nhac buon, danh cho doi lua."

Genre.create! name: "Nhac Rock",
  description: "The loai nhac tiet tau nhanh, soi dong ruc lua."

Genre.create! name: "Nhac Cach Mang",
  description: "The loai nhac sang tac trong chien tranh Dong Duong"

Artist.create! name: "Faker",
  description: "Best Singer of 2017"

Artist.create! name: "Hater",
  description: "Bad Singer of 2018"

Artist.create! name: "Unnamed",
  description: "Unknown Singer of 2019"
