50.times do |n|
  name = Faker::JapaneseMedia::OnePiece.character
  birthday = Faker::Date.between(from: '1930-01-01', to: Date.today)
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               birthday: birthday,
               email: email,
               password: password,
               )
end
