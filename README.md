# WIP

https://infinite-badlands-29373.herokuapp.com/

I'm interested in learning about Rails, so this project follows the Rails Intro Tutorial. I've deployed it to Heroku and am in the process of adding more features.

### To run locally

Dependencies:

- Ruby v. 2.5.1
- Bundler gem
- Postgresql

```bash
git clone https://github.com/steviekaye/rails-blog.git
cd rails-blog
bundle install
sudo -u postgres createuser -s rails-blog
bundle exec rake db:create:all
rake db:migrate
rake db:seed
rails server
```

And browse to `localhost:3000`

### Tests

Dependencies:

- Chromedriver
- Firefox

To run tests

```bash
bin/rspec
```
