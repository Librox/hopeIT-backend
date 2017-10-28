# Elpis

Backend for our HopeIT hackathon entry

## Requirements

| Name | Version |
|:---------------------|:----------------------------------------|
| Ruby | 2.4.2 |
| PostgreSQL | 9.6 |
| Ruby on Rails | 5.1.4 |

## Installation

### I just want to try this thing

1. Install Docker (or modify `.env.development.local`)
2. `git clone https://github.com/asi-pwr/hopeIT-backend.git elpis`
3. `cd elpis`
4. `bundle install --jobs=4`
5. `bash start_database.sh`
6. `rake db:create db:setup`
7. `rails s`

### Development

1. Install Docker (or modify `.env.development.local`)
2. `git clone https://github.com/asi-pwr/hopeIT-backend.git elpis`
3. `cd elpis`
4. `bin/setup`
5. `rails s`

## License

Elpis is Copyright © 2017 Michał Zając and Jan Librowski. It is free
software, and may be redistributed under the terms specified in the
[LICENSE](/LICENSE) file.
