
# 📚 Memo-me

<img width="1792" alt="Screen Shot 2021-09-06 at 18 19 35" src="https://user-images.githubusercontent.com/85116141/132194826-aeb2b975-1e1d-41e4-8317-0e3abb1511d8.png">
<img width="1792" alt="Screen Shot 2021-09-06 at 18 19 45" src="https://user-images.githubusercontent.com/85116141/132193601-80c9ee02-41b5-47d1-80f7-248e5140eaea.png">
<img width="1792" alt="Screen Shot 2021-09-06 at 18 20 08" src="https://user-images.githubusercontent.com/85116141/132193609-89c56364-e89a-4e9a-86fa-0b5e8f6389f8.png">
<img width="1792" alt="Screen Shot 2021-09-06 at 18 20 42" src="https://user-images.githubusercontent.com/85116141/132193621-5fae0d62-b0d9-4956-b33a-dfb99bb6a5c8.png">
<img width="1792" alt="Screen Shot 2021-09-06 at 18 21 14" src="https://user-images.githubusercontent.com/85116141/132193632-f6b0b1ab-244e-4316-8b78-67a2b153bcb2.png">

<br>
App home: https://www.memo-me.co/
   

## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
MAPBOX_API_KEY=your_own_mapbox_api_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 6](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
Inspired by Jane Mount's [Bibliophile](https://www.amazon.com/Bibliophile-Illustrated-Miscellany-Jane-Mount/dp/1452167230) and a story my father once told me: "Why do we keep books? ... We keep books because they remind us of the new perspectives and lessons we learned".

## Team Members
- [Daniel Rabotini](https://www.linkedin.com/in/daniel-rabottini/)
- [Jose Miranda]()

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
