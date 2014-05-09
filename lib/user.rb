# bcrypt generates the password hash
require 'bcrypt'
class User

  include DataMapper::Resource
  
  property :id, Serial
  property :email, String

  #password and salt stored here
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
