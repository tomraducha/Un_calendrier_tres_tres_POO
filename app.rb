require 'bundler'
Bundler.require

require_relative 'lib/user'
require_relative 'lib/event'

julie = User.new('julie@gmail.lol', 18)
thomas = User.new('thomas@gmail.lol', 30)
guillaume = User.new('guillaume@gmail.lol', 30)

standup = Event.new('2019-01-13 09:00', 10, 'standup quotidien', ['julie@gmail.lol', 'thomas@gmail.lol'])

visio = Event.new('2019-01-13 09:00', 10, 'visio', ['guillaume@gmail.lol', 'thomas@gmail.lol'])

visio_average_age = visio.attendees_average_age
standup_average_age = standup.attendees_average_age

puts visio_average_age
puts standup_average_age
