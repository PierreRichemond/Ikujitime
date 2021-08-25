require "open-uri";
require 'nokogiri';

gender_array = ['boy', 'girl', 'other']
occasion_array = ['graduation', 'random surprise', 'birthday', 'mutual friend\'s birthday', 'picnic']
startdatetime_array = ['2014-05-12 07:00', '2014-05-23 08:00', '2014-06-01 11:00', '2014-06-11 11:00', '2014-06-15 10:00']
enddatetime_array = ['2014-06-16 20:00', '2014-06-23 20:00']

Gift.destroy_all
puts "gifts db reset"

ages = ['0-2', '2-3', '3-5', '5-7', '8-10']
ages.each do |age|
  url_product = "https://www.toysrus.com/shop-by-age/2-years/?cgid=#{age}-years"

  html_file = URI.open(url_product).read
  html_doc = Nokogiri::HTML(html_file)

  html_doc.search('.tile-body').each do |card_element|
    name = card_element.search('.pdp-link').text.strip
    price = card_element.search('.price .sales').text.strip
    link = card_element.search('.pdp-link a').first.attribute('href').value

    product_html = URI.open(link).read
    product_doc = Nokogiri::HTML(product_html)
    description = product_doc.search('.details-description').text.strip
    image = product_doc.search('.primary-images img')

    gift_image = URI.open(image['src'])

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

puts "#{Gift.count} gifts were created"


name = [
  'Playground Shibuya Kids',
  'Asobono',
  'Kidzania Tokyo',
  'Tondemi Heiwajima',
  'Aneby Trimaprk',
  'Kid-O-Kid By BorneLund',
  'Lego Discovery Centre'
]
address = [
  '18-11 Shinsenchō, Konami Sports Club 9F, Shibuya City, Tōkyō-to 150-0045',
  'Tokyo Dome, 1-3-61 Kōraku-en, Bunkyō-ku, Tokyo',
  'Tokyo-to, Koto-ku, Toyosu 2-4-9 Urban Dock LaLaport Toyosu, North Port 3F, 33200',
  '1-1 Heiwajima 1-1-chome, Ota-ku, Tokyo 143-0006, Japan',
  'Venusfort 1F, 1-3-15 Aomi, Kotou-Ku, Tokyo 135-0064',
  'Le FRONT Kawasaki 6F, 1-11 Nisshinchō, Kawasaki-ku, Kawasaki, Kanagawa 210-0024, Japan',
  'Decks Tokyo Beach Island Mall, 3F Odaiba 1-6-1 Minato-ku Tokyo 135-0091'
]
price = [
  '500',
  '950',
  '1950',
  '600',
  '880',
  '600',
  '2500'
]
description = [
  'Playground Shibuya Kids is a boutique indoor play space filled with colourful play equipment for little tots from 0 to 5 years old. Aside from the infant play area, the playground has five other main play zones – an inflated structure that doubles as a mini climbing wall and bouncy fun; an even bigger inflated structure inspired by a train for more climbing and it also has a slide and a ball pit; a dedicated area with train and car sets; a pretend play area where kids can play at being shopkeepers and experienced cooks, and; a sandpit with toys, which has a nifty cubicle attached to it for little tots to blow off the sand from their little hands and feet.',
  'As one of the largest indoor playground in Tokyo, ASOBono! provides plenty of entertainment for kiddies up to 7 years old. The play space is divided into several different themes, each with a different attraction. The Ocean-themed zone comprises a huge ball pool with a ship, bouncy castle, treehouse, slides, and plenty of opportunities for climbing. For kids who need a reprieve from all that action, you can find toys, board games, dollhouses, as well as a small library to engage their minds in the Forest area.',
  'An indoor amusement park built like a city scaled down to kiddie size complete with a myriad of jobs, KidZania brings real-world experiences to young ones from 3 to 15 years old. The place has it all – paved streets, vehicles, buildings, shops, and currency of its own.',
  'Little ones’ boundless energy can be spent bouncing, climbing and running at Space Athletic Tondemi at Heiwajima, a sprawling indoor activity centre. Nearly one-third of the space is occupied by trampolines where you can go wild jumping, practice your dunk shots, dive into a sponge pit, spike a volleyball, and play games. Aside from that, the facility also has six other zones you can explore.',
  'Located at Venusfort is Aneby Trimpark, a spacious indoor playground with ample gymnastics for kids. With a trampoline, wooden train sets, assembly kits, building blocks, board games, play-doh, and play structures for climbing, sliding and imaginary adventures, little tykes can easily spend a couple of hours here. If that’s not enough fun, there is also a craft activities room, a circuit for pedal go-kart, a mini library, and food stands for pretend play!',
  'Designed for kids 6 months and above, Kid-O-Kid by BorneLund features a mixed bag of play equipment. There’s a climbing wall, a UFO-like merry-go-round, an inflated bed for bouncing, and an inflated wheel to manoeuvre like a hamster. For the kiddies gushing with creative juices, there are crayons and paints that they can use to draw on paper or on a glass surface, as well as a wide wall with colourful magnets where they can go wild with their creations. They can also cultivate their imagination playing with the diorama of a city which comes with car and train tracks and at the pretend play corner consisting of toy provisions and kitchen tools.',
  'Ideal for kids below 8 years old, Lego Discovery Centre is more of an indoor theme park than a playground. In addition to gentle rides and several build and play zones, the centre also offers a look into how Lego bricks are made and provides creative workshops. On display at the MINILAND® is a miniature version of Tokyo featuring some of the city’s most popular attractions if you ever wanted a one-day tour of Tokyo.'
]

activity_link = [
  'http://playground4kids.co.jp/',
  'https://www.tokyo-dome.co.jp/en/tourists/asobono/',
  'http://www.kidzania.jp/tokyo/en/',
  'https://bandainamco-am.co.jp/kids/tondemi/heiwajima/',
  'https://anebytrimpark.com/english/',
  'https://kidokid.bornelund.co.jp/kawasaki/',
  'https://tokyo.legolanddiscoverycenter.jp/en/'
]
url_activity = "https://www.bykido.com/blogs/playgrounds-and-more-tokyo/fun-indoor-playgrounds-to-bring-your-kids-to-in-tokyo"

html_activity = URI.open(url_activity).read
html_activity_doc = Nokogiri::HTML(html_activity)

  # activity_url = html_activity_doc.search('.rte p a').map { |el| el.text.strip}
image = html_activity_doc.search('.rte img').map { |el| el['src']}

number = [0, 1, 2, 3, 4, 5, 6, 7]
number.each do |num|
  activity_image = URI.open(image[num])
  activity = Activity.create!(
    name: name[num],
    price: price[num],
    address: address[num],
    description: description[num],
    website_link: activity_link[num]
  )
  activity.photo.attach(io: activity_image, filename: 'activity.png', content_type: 'image/png')
end

puts "#{Activity.count} activities were created"

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

      rand(1..5).times do
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
