class User < ApplicationRecord

  # email validation
  before_save { self.email = email.downcase}
  EMAIL_VALIDATION_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
            format: { with: EMAIL_VALIDATION_REGEX },
            uniqueness: { case_sensitive: false }

  # password validation
  # bcrypt gem uses has_secure_password.
  # User has password and password_confirmation fields
  # users table has encrypted password_digest column
  has_secure_password
  PASSWORD_VALIDATION_REGEX = /\A
    (?=.{8,})           # Must contain 8 or more characters
    (?=.*\d)            # Must contain a digit
    (?=.*[a-z])         # Must contain a lower case character
    (?=.*[A-Z])         # Must contain an upper case character
    (?=.*[[:punct:]])   # Must contain a symbol
    (?!.*(\s|\\|<|>))   # Must not contain whitespace, \, <, or >
    .*                  # Matches everything (above lines cover validity)
  /x # x means ignore whitespace in Regex creation, not actual formatting
  validates :password, presence: true,
            format: { with: PASSWORD_VALIDATION_REGEX }


  # name validation
  validates :name, presence: true, length: { maximum: 50 }


  #is_admin does not need validation, boolean value constrained to T/F

end