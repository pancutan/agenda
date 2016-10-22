# Programa para poblar un archivo db/seeds.rb, que corresponda a un formato pais - provincia conformado
# aproximadamente de la siguiente manera
#
# rails generate scaffold Country pais
# rails generate scaffold Province provincia country_id:integer
#
# (2016) Copyleft Sergio A. Alonso
#

require 'rubygems'

require 'carmen'
include Carmen

# Agregue un mejor soporte para debugging
require 'pry'
require 'pry-byebug'

# Agregue también soporte para entrar en modo debugging automatico en caso que salten excepciones:
require 'pry-rescue'
require 'pry-stack_explorer'

# Agregue colores y formateo a las salidas de la rails console
require 'awesome_print'

i = 1
paises = Carmen::Country.all
paises.each do |p|
  puts ""
  puts "Country.create(pais: \"#{p.name}\")"
  p.subregions.each do |s|
    puts "Province.create(provincia: \"#{s.name}\", country_id: #{i})"
  end
  i = i + 1
end

# Agregue la salida de este comando al seeds.rb:
# rescue seedar_paises.rb >> db/seeds.rb
