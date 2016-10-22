rails tmp:clear
rails assets:clean
rails assets:precompile

# Para cuando termine
speaker-test -t sine -f 1000 -l 1
