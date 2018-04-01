# Dog Care Bot
Helps to care dogs

## Todo
- Circle CI
- Make post method small
- Move app to lib
- AI

## Commands
```
$ docker build -t dog-care-bot . && docker run -it -e RUBYOPT=-EUTF-8 dog-care-bot bundle exec rspec -fd
$ docker run --rm -v "$PWD":/app -w /app dog-care-bot bundle install
```
