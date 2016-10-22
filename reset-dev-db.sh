bin/rails db:environment:set RAILS_ENV=development
rails db:reset --trace
# Ya esta incluido seed en las instrucciones de arriba

# Para cuando termine
speaker-test -t sine -f 1000 -l 1
