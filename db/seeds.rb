require "open-uri";

gender_array = ['boy', 'girl', 'other']
occasion_array = ['graduation', 'random surprise', 'birthday', '']
date_array = []
time_array = ['9:00', '10:00', '11:00', '12:00', '13:00'  ]

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
        birthday: Faker::Date.between(from: '2014-01-01', to: '2020-12-31')
      )

      child.photo.attach(io: file, filename: 'child.png', content_type: 'image/png')

      5.times do
        file = URI.open('https://source.unsplash.com/random/?activity')
        booked_activity = BookedActivity.create!(
          start_date: Faker::Date.between(from: '2017-07-01', to: '2017-12-31'),
          end_date: Faker::Date.between(from: '201-01-01', to: '2021-7-31'),
          child_id = (Child.last.id-15..Child.last.id),
          activity_id = (Activity.last.id-5..Activity.last.id)
        )
        3.times do
          booked_activity.photo.attach(io: file, filename: 'booked_activity.png', content_type: 'image/png')
        end
      end

      5.times do
        file = URI.open('https://source.unsplash.com/random/?activity')
        purchased_gift = BookedActivity.create!(
          date: Faker::Date.between(from: '2015-01-01', to: '2021-7-31'),
          occasion = occasion_array.sample,
          child_id = (Child.last.id-15..Child.last.id),
          gift_id = (Gift.last.id-3..Gift.last.id)
        )
        3.times do
          purchased_gift.photo.attach(io: file, filename: 'purchased_gift.png', content_type: 'image/png')
        end
      end
    end
  end

puts "Created #{User.count} accounts, last user id is #{User.last.id}"
