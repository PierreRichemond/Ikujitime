require "open-uri";
require 'nokogiri'

gender_array = ['boy', 'girl', 'other']
occasion_array = ['graduation', 'random surprise', 'birthday', 'mutual friend\'s birthday', '']
startdatetime_array = ['2014-05-12 07:00', '2014-05-23 08:00', '2014-06-01 11:00', '2014-06-11 11:00', '2014-06-15 10:00']
enddatetime_array = ['2014-06-16 20:00', '2014-06-23 20:00']


item = ''
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.standard-card-new__article-title').each do |element|
  puts element.text.strip
  puts element.attribute('href').value
end

50.times do
  activity = Activity.create!(

  )
end


  15.times do
   file = URI.open('https://thispersondoesnotexist.com/image')
   user = User.create!(
      email: Faker::Internet.safe_email,
      password: '123123',
      name: Faker::Name.first_name,
    )
    user.photo.attach(io: file, filename: 'user.png', content_type: 'image/png')

    5.times do
      file = URI.open('https://source.unsplash.com/random/?kids')
      child = Child.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        middle_name: Faker::Name.middle_name,
        parent: Faker::Name.name,
        gender: gender_array.sample,
        hobby: Faker::Hobby.activity,
        birthday: Faker::Date.between(from: '2014-01-01', to: '2020-12-31'),
        user: user
      )

      child.photo.attach(io: file, filename: 'child.png', content_type: 'image/png')

      (1..5).times do
        booked_activity = BookedActivity.create!(
          start_date: startdatetime_array.sample,
          end_date: enddatetime_array.sample,
          child: child,
          activity_id = (Activity.last.id-5..Activity.last.id)
        )
        (1..3).times do
          file = URI.open('https://source.unsplash.com/random/?activity')
          booked_activity.photo.attach(io: file, filename: 'booked_activity.png', content_type: 'image/png')
        end
      end

      (1..5).times do
        purchased_gift = BookedActivity.create!(
          date: Faker::Date.between(from: '2015-01-01', to: '2021-7-31'),
          occasion = occasion_array.sample,
          child: child,
          gift_id = (Gift.last.id-3..Gift.last.id)
        )
        (1..3).times do
          # add random photo query
          file = URI.open('https://source.unsplash.com/random/?')
          purchased_gift.photo.attach(io: file, filename: 'purchased_gift.png', content_type: 'image/png')
        end
      end
    end
  end

puts "Created #{User.count} accounts, last user id is #{User.last.id}"
