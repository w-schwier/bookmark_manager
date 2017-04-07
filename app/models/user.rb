require 'bcrypt'

class User

  include DataMapper::Resource
  has n, :links, through: Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true
  property :password_digest, Text
  attr_reader :password
  attr_accessor :confirm_password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



  # default would be password_confirmation, unless changed like below
  validates_confirmation_of :password, confirm: :confirm_password

end
