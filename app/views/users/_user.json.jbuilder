json.extract! user, :id, :nombre, :apellido, :email, :activo, :edad, :detalles, :created_at, :updated_at
json.url user_url(user, format: :json)