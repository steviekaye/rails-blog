# [Rails-blog](https://infinite-badlands-29373.herokuapp.com/)

I'm interested in learning about Rails, so this project used the [Rails Intro Tutorial](https://guides.rubyonrails.org/getting_started.html) as a starting point, which I then extended.

Some of the things I learned over the course of the project beyond the scope of the tutorial included

- CSS/SASS styling, including responsive principles & FlexBox
- Testing with RSpec, including the use of Capybara for feature tests
- deployment to Heroku
- git workflow, including branches and pull request feedback cycles

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
- Chrome

To run tests

```bash
bin/rspec
```
