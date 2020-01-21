* Ruby version
> 2.5.1

* Database creation
>rake db:create
>rake db:migrate

* How to run the test suite
 > bundle exec rspec

* Services (job queues, cache servers, search engines, etc.)
> bundle exec whenever --set environment='development'
> whenever --update-crontab --set environment='development'

* Deployment instructions
> bundle exec rails s

* API fetch
 > GET http://localhost:3000/service/AmazonCloudFront/region/us-east-1
 > GET http://localhost:3000//service/AmazonCloudFront/region/us-east-1?date=2019-12-01
