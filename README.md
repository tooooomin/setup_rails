## Local development

### Required software

* Ruby 2.5.0
* Ruby on Rails 5.0.6
* PostgreSQL 9.5 or later

### Database setup

```shell
bin/rails db:setup
```

### Run Specs (Tests)

```shell
bundle exec rspec
```

### Start local servers

```shell
bundle exec foreman start
=> You should access http://localhost:5000/

or

(on different tabs)
bin/rails server
bin/webpack-dev-server
```