# Agenda Tec
Official site for event/announcement creation that works with the weekly schedule of ITESM Puebla.

## Getting Started
This repository was created as a final project for the course Diseño y arquitectura de software (Ene 17 Gpo 1).
We use a postgresql database and Rails 4.

### Installation
Clone the repository:
```
git clone https://github.com/rdorame/AgendaTec.git
```
Run a bundle install
```
bundle install
```
and update it
```
bundle update
```
Then you must change the username and password on /config/database.yml

Run the respective migrations
```
rake db:migrate
```

Run the seed file
```
rake db:seed
```

Run the server
```
rails server
```
