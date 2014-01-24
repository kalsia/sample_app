namespace :db do
  desc "Fill database with sample data"

    task prepare_database: :environment do
      User.create!(name: "Administrator",
                   email: "marco.gaiazzi.ggl@gmail.com",
                   password: "administrator",
                   password_confirmation: "administrator").toggle!(:admin)

    6.times do |n|
        name  = Faker::Name.name
        email = "fakemail-#{n+1}@insubria.fake"
        password  = "password"
        User.create!(name: name,
                     email: email,
                     password: password,
                     password_confirmation: password)
      end
    end

    task populate: :environment do
    User.create!(name: "Administrator",
                 email: "marco.gaiazzi.ggl@gmail.com",
                 password: "administrator",
                 password_confirmation: "administrator").toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "fakemail-#{n+1}@insubria.fake"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
      5.times do
        title = Faker::Lorem.sentence(5)
        author = Faker::Name.name
        publisher = Faker::Name.name
        release_date = rand(10.years).ago
        n_pages = rand(50...1000)
        image_url = "http://andyswordsandpictures.files.wordpress.com/2013/03/blank-book.jpg"
        isbn = 1234567891011
        description = "Descrizione di prova del libro"
        users.each { |user| user.books.create!(title: title, author: author, publisher: publisher, release_date: release_date, n_pages: n_pages, image_url: image_url, isbn: isbn, description: description) }
      end
  end
end