me = User.find_or_create_by!(
  email: 'jemiller1963@gmail.com',
) do |u|
  u.password = '//L0mbil//'
end

10.times do
  listing = Listing.create!(
    host: me,
    title: Faker::Lorem.words(number: 5).join(" "),
    about: Faker::Lorem.paragraph,
    max_guests: (1...5).to_a.sample,
    address_line1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    country: 'US',
    status: [:draft, :published].sample,
  )
end

10.times do
  host = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  10.times do
    listing = Listing.create!(
      host: host,
      title: Faker::Lorem.words(number: 5).join(" "),
      about: Faker::Lorem.paragraph,
      max_guests: (1...5).to_a.sample,
      address_line1: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: 'US',
      status: [:draft, :published].sample,
    )
  end
end

puts "Complete"
