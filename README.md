# WIP

https://infinite-badlands-29373.herokuapp.com/

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
rails server
```

And browse to `localhost:3000`
