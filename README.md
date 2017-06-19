# Lenda Word Find

This API provides a backend for the Lenda Word Find test

## Installation

This project uses RVM, although it is not required it helps to have a fresh start for the gems used in this project. If you are using RVM already, once you navigate into the project directory a new Gemset will be created and you would have to install Bundler into it.

### Prerequisites
You need to have installed:
1. PostgreSQL and have SUPERUSER permissions on the Database.
(Alternatively you can [try using sqlite]())
2. Bundler (Run `gem install bundler` inside the Gemset)
3. Ruby v2.3.3 or higher

### Instructions
In your terminal, located inside the project directory execute:
1. `$ bundle install`
2. `$ rails db:create db:migrate db:seed`

## Running the tests
* `$ rspec`

If you want to run a specific test you can run it like this:
* `rspec spec/requests/v1/games_spec.rb:166`

## Running the server
By default the server address is http://localhost:3000

* `$ rails s`

## Endopoints
This API comes with a separation of versions using URL namespacing.
The current available version is Version 1. To access endpoints in this namespace use this host:

* http://localhost:3000/api/v1

### Create a new game `POST /game`

* Example http://localhost:3000/api/v1/game

### Add a word to a game `POST /game/{game_id}`

* Example http://localhost:3000/api/v1/game/1

### Retrieve a game `GET /game/{game_id}`

* Example http://localhost:3000/api/v1/game/1

-----

#### Using sqlite
In case you are having trouble installing PostgreSQL or the `pg` gem due to your system configuration, following this instructions to use Sqlite can help to run the API.


Be aware that when using sqlite if you open the project on a text editor it might crash due to the size of the db files created inside the directory. This option is recommended as a last resource.

1. Modify the Gemfile
 * Change `gem 'pg'` by `gem 'sqlite3'`
2. Run `$ bundle install`
2. Modify config/database.yml
 * Change `adapter: postgresql` by `adapter: sqlite3`
 * comment out `pool: 5`
