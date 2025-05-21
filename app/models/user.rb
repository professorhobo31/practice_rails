# email:string
# password_digest:string
#
# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password # This line needs us to go into our Gemfile and enabling bcrypt. It'll use our password_digest DB column to store a hashed version of the password
end

# This user model is a wrapper around our DB, we can use it to query our DB but also to create new users and delete them. There's generally two "levels" to a DB: one where we query and see all our users and data and another where we see an instance of an user which is just a single row in our table. The "has_secure_password" command adds the two virtual attributes related to passwords. This way, what we really do in the backend when creating an user is get an email, a password and a password_confirmation and if the last 2 match, the program will generate and store the hashed password_digest in our DB. We can test it by running "User.create({email: "pepepupi@gmail.com", password: "password", password_confirmation: "password"})" inside the rails console to create our first user.
