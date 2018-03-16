# Dog Care Bot
Helps to care dogs

## Todo
- security vulnerability
- Make post method small
- Move app to lib
- AI

## Commands
```
$ docker build -t dog-care-bot . && docker run -it dog-care-bot bundle exec rspec -fd
$ docker run --rm -v "$PWD":/app -w /app dog-care-bot bundle install
```
