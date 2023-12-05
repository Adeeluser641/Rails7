# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#
#
# use it if you wanna add user on your own but delete previous suers
#
# user = user.where(email: "chris@gorails.com")find_or_initialize
#   user.update ( password: "password", password_confirmation: "Password"

#)
# rails db:seed
