class User
  attr_accessor :email, :age

  @@all_users = []
  # Constructor
  def initialize(email, age)
    @email = email
    @age = age
    @@all_users << self
  end

  def self.all
    @@all_users
  end

  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end

#
# => []
# print User.all
# puts
#
# julie = User.new('julie@gmail.lol', 18)
# => [ <@age=18, @email="julie@gmail.lol"> ]
# print User.all
# puts
#
# thomas = User.new('thomas@gmail.lol', 30)
# => [ <@age=18, @email="julie@gmail.lol">, <@age=30, @email="thomas@gmail.lol"> ]
# print User.all
# puts
