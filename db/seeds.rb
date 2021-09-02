require "open-uri";
require 'nokogiri';
require 'csv'

# Creating One user with child and event to it
# User.destroy_all
# puts 'cleaning the DB...'

# 1.times do
#   # file0 = File.open('app/assets/images/IMG_8728.JPG')
#     user = User.create!(
#           email: "dankr59@gmail.com",
#           password: '123123',
#           name: 'Daniel Rabottini',
#         )
#         # user.photo.attach(io: file0, filename: 'user.png', content_type: 'image/png')

#           file = URI.open('https://images.unsplash.com/photo-1471938537155-7de0bd123d0c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
#           child = Child.create!(
#             first_name: "Kenta",
#             last_name: "Nomura",
#             middle_name: "James",
#             parent: "Justin Nomura",
#             gender: "male",
#             hobby: "playing with Tomica cars",
#             birthday: '2019-09-03',
#             user: user
#         )

#         child.photo.attach(io: file, filename: 'child.png', content_type: 'image/png')

#           event0 = Event.create!(
#             start_date: '2020-09-03 10:00',
#             end_date: '2020-09-03 17:00',
#             occasion: 'Birthday Party',
#             child: child,
#             # gift_id: rand(Gift.last.id-79..Gift.last.id),
#           )
#           file1 = URI.open('https://images.unsplash.com/photo-1583875762487-5f8f7c718d14?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
#           event0.photos.attach(io: file1, filename: 'event1.png', content_type: 'image/png')
#           file2 = URI.open('https://images.unsplash.com/photo-1496637721836-f46d116e6d34?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80')
#           event0.photos.attach(io: file2, filename: 'event2.png', content_type: 'image/png')
#           file3 = URI.open('https://images.unsplash.com/photo-1471938537155-7de0bd123d0c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
#           event0.photos.attach(io: file3, filename: 'event3.png', content_type: 'image/png')
#           file4 = URI.open('https://images.unsplash.com/photo-1544829832-c8047d6b9d89?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80')
#           event0.photos.attach(io: file4, filename: 'event4.png', content_type: 'image/png')
# end

# puts "#{User.last.name} added to db"

# seeding gift, use below db
# ===========================================================
Gift.destroy_all
puts "gifts db reset"

ages = ['0---24-months', '2-years', '3---4-years', '5---7-years', '8---10-years', '0---24-months?start=16&sz=14', '2-years?start=16&sz=14', '3---4-years?start=16&sz=14', '5---7-years?start=16&sz=14', '8---10-years?start=16&sz=14']
ages.each do |age|
  url_product = "https://www.toysrus.com/#{age}/"

  html_file = URI.open(url_product).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.tile-body').each do |card_element|
    name = card_element.search('.pdp-link').text.strip
    price = card_element.search('.price .sales').text.strip
    link = card_element.search('.pdp-link a').first.attribute('href').value

    product_html = URI.open(link).read
    product_doc = Nokogiri::HTML(product_html)
    description = product_doc.search('.details-description').text.strip
    image = product_doc.search('.primary-images img').attribute('src').value

    gift_image = URI.open(image)

    gift = Gift.create!(
      name: name,
      price: price,
      description: description,
      website_link: link,
      start_age: age.split('-')[0],
      end_age: age.split('-')[1]
    )
    gift.photo.attach(io: gift_image, filename: 'gift.png', content_type: 'image/png')
  end

  end

# arrays = ['2-4/-/N-aapp9', '5-7/-/N-ts1nr', '8-10/-/N-wn8i6']
# arrays.each do |array|
# target_url = "https://www.target.com/c/toys-for-ages-#{array}"

# fischer_url = "https://www.fisher-price.com/en-us/shop/age/2-plus-years"

# html_file_fischer = URI.open(fischer_url).read
# html_doc_fischer = Nokogiri::HTML(html_file_fischer)
# html_doc_fischer.search('.grid-title-wrapper').each do |tag|
#   p tag
# end

  # html_doc_fischer.search(".scroll-loaded").each do |card|
  #   p card
  #   name = card.search(".grid-title").text.strip
  #   puts name
  # end
  #   price = target_card.search('.current-price').text.strip
  #   puts price
  # end
# end


# puts "#{Gift.count} gifts were created"

# User below for seeding activity
# ============================================
#   Event.destroy_all
#   Activity.destroy_all
#   puts "All activities and events deleted from db"

# csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
# filepath = 'db/activity.csv'

# CSV.foreach(filepath, csv_options) do |row|
#   activity_image = URI.open(row[5])
#   activity = Activity.create!(
#     name: row[0],
#     description: row[1],
#     price: row[2],
#     address: row[3],
#     website_link: row[4],
#     tag_list: row[6].split(' ')
#     )
#     activity.photo.attach(io: activity_image, filename: 'activity.png', content_type: 'image/png')
# end

# puts "Part 1. #{Activity.count} activities were created"


  # For extra users, child, and events for your db uncomment the below code
  # ===============================================
  # gender_array = ['male', 'female', 'others']
  # occasion_array = ['graduation', 'random surprise', 'birthday', 'mutual friend\'s birthday', 'first time crawling', 'first time walking', 'first loose tooth', 'first day of school', 'sports tournament', 'elementary school award night']
  # startdatetime_array = ['2017-05-12 07:00', '2017-05-23 08:00', '2017-06-01 11:00', '2017-06-11 11:00', '2017-06-15 10:00']
  # enddatetime_array = ['2017-06-16 20:00', '2017-06-23 20:00']

  # User.destroy_all
  # Child.destroy_all
  # Event.destroy_all

  # puts "db deleted for users, child, and events"

  #   7.times do
  #    file = URI.open('https://thispersondoesnotexist.com/image')
  #    user = User.create!(
    #         email: Faker::Internet.safe_email,
#         password: '123123',
#         name: Faker::Name.first_name,
#       )
#       user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

#       3.times do
#         file = URI.open('https://source.unsplash.com/random/?kids')
#         child = Child.create!(
#           first_name: Faker::Name.first_name,
#           last_name: Faker::Name.last_name,
#           middle_name: Faker::Name.middle_name,
#           parent: Faker::Name.name,
#           gender: gender_array.sample,
#           hobby: Faker::Hobby.activity,
#           birthday: Faker::Date.between(from: '2014-01-01', to: '2020-12-31'),
#           user: user
#       )

#       child.photo.attach(io: file, filename: 'child.png', content_type: 'image/png')

#       rand(1..3).times do
#         event = Event.create!(
#           start_date: startdatetime_array.sample,
#           end_date: enddatetime_array.sample,
#           occasion: occasion_array.sample,
#           child: child,
#           gift_id: rand(Gift.last.id-79..Gift.last.id),
#           activity_id: rand(Activity.last.id-6..Activity.last.id)
#         )
#         rand(1..2).times do
#           file = URI.open('https://source.unsplash.com/random/?activity')
#           event.photos.attach(io: file, filename: 'booked_activity.png', content_type: 'image/png')
#         end
#       end
#     end
#   end

# puts "Created #{User.count} accounts, last user id is #{User.last.id}"
