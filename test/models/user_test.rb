require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @valid_password = '*Test123'
    @valid_user = User.create(name: 'Valid User', email: 'valid@usr.com',
                           is_admin: false, password: @valid_password,
                           password_confirmation: @valid_password)
  end

  test 'valid_user is valid' do
    assert @valid_user.valid?
  end

  test 'empty password is not valid' do
    invalid_user = User.create(name: 'Al', email: 'al@usr.com',
                            is_admin: false, password: '',
                            password_confirmation: '')
    assert invalid_user.invalid?
  end

  test 'differing valid_passwords are not valid' do
    invalid_user = User.create(name: 'Bill', email: 'bill@usr.com',
                            is_admin: false, password: @valid_password,
                            password_confirmation: 'Test123*')
    assert invalid_user.invalid?
  end

  test 'short password is not valid' do
    invalid_user = User.create(name: 'Carl', email: 'carl@usr.com',
                            is_admin: false, password: '*Test12',
                            password_confirmation: '*Test12')
    assert invalid_user.invalid?
  end

  test 'password missing special character is not valid' do
    invalid_user = User.create(name: 'Dan', email: 'dan@usr.com',
                            is_admin: false, password: 'Test1234',
                            password_confirmation: 'Test1234')
    assert invalid_user.invalid?
  end

  test 'password missing number is not valid' do
    invalid_user = User.create(name: 'Eric', email: 'eric@usr.com',
                            is_admin: false, password: '*TestTest*',
                            password_confirmation: '*TestTest*')
    assert invalid_user.invalid?
  end

  test 'password missing uppercase is not valid' do
    invalid_user = User.create(name: 'Fred', email: 'fred@usr.com',
                            is_admin: false, password: '*test123',
                            password_confirmation: '*test123')
    assert invalid_user.invalid?
  end

  test 'password missing lowercase is not valid' do
    invalid_user = User.create(name: 'Greg', email: 'greg@usr.com',
                            is_admin: false, password: '*TEST123',
                            password_confirmation: '*TEST123')
    assert invalid_user.invalid?
  end

  test "password with \\ is not valid" do
    invalid_user = User.create(name: 'Hal', email: 'hal@usr.com',
                            is_admin: false, password: "*Test123\\",
                            password_confirmation: "*Test123\\")
    assert invalid_user.invalid?
  end

  test 'password with > is not valid' do
    invalid_user = User.create(name: 'Ian', email: 'ian@usr.com',
                            is_admin: false, password: '*Test>123',
                            password_confirmation: '*Test>123')
    assert invalid_user.invalid?
  end

  test 'password with < is not valid' do
    invalid_user = User.create(name: 'Joe', email: 'joe@usr.com',
                            is_admin: false, password: 'Test<123',
                            password_confirmation: 'Test<123')
    assert invalid_user.invalid?
  end

  test 'password with whitespace is not valid' do
    invalid_user = User.create(name: 'Ken', email: 'ken@usr.com',
                            is_admin: false, password: '*Test 123',
                            password_confirmation: '*Test 123')
    assert invalid_user.invalid?
  end

  test 'nil password is not valid' do
    invalid_user = User.create(name: 'Lee', email: 'lee@usr.com',
                            is_admin: false)
    assert invalid_user.invalid?
  end

  test 'password with newline is not valid' do
    invalid_user = User.create(name: 'Mo', email: 'mo@usr.com',
                            is_admin: false, password: "*Test123\n",
                            password_confirmation: "*Test123\n")
    assert invalid_user.invalid?
  end

  test 'password with script is not valid' do
    invalid_user = User.create(name: 'Nick', email: 'nick@usr.com',
                            is_admin: false, password: "*Test123<script>alert();</script>",
                            password_confirmation: "*Test123<script>alert();</script>")
    assert invalid_user.invalid?
  end

end
