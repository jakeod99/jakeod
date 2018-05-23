class User < ApplicationRecord

  # email validation
  before_save { self.email = email.downcase}
  EMAIL_VALIDATION_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
            format: { with: EMAIL_VALIDATION_REGEX },
            uniqueness: { case_sensitive: false }


  # password validation
  # removes password_too_common validation from NOBSPW validations
  NOBSPW.configuration.validation_methods.delete(:password_too_common?)

  # bcrypt gem uses this.
  # User has password and password_confirmation fields
  # users table has encrypted password_digest column
  has_secure_password

  # this runs NOBSPW validation. username => name b/c User's username is name
  validates :password, password: { :username => :name},
            if: -> { new_record? || changes[:password] }


  # name validation
  validates :name, presence: true, length: { maximum: 50 }


  #
  validates :is_admin, presence: true

end