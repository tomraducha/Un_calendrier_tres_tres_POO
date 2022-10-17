require 'time'
require 'pry'

class Event
  attr_accessor :start_date

  def initialize(start_date, duration, title, attendees)
    @start_date = Time.parse(start_date)
    @duration = duration.to_i
    @title = title
    @attendees = attendees
  end

  def postpone_24h
    @start_date += 60 * 60 * 24
  end

  def end_date
    return @start_date + (@duration * 60)
  end

  def is_past?
    @start_date < Time.now
  end

  def is_future?
    # inverse
    !is_past?
  end

  def is_soon?
    is_future? && start_date - Time.now < 30 * 60
  end

  def to_s
    return ">Titre : #{@title}\n>Date de début : #{@start_date}\n>Durée : #{@duration} minutes\n>Invités : #{@attendees}"
  end

  # Retourne tous les participants en tant que User
  def attendees_to_user
    return @attendees.map { |email| User.find_by_email(email) }
  end

  # Retourne l'age moyen des participants
  def attendees_average_age
    users = attendees_to_user
    average_age = users.map { |user| user.age }
                       .sum / users.count
    return average_age
  end
end

# ev = Event.new('2019-01-13 09:00', 10, 'standup quotidien', ['truc@machin.com', 'bidule@chose.fr'])
# ev.postpone_24h
# => <@attendees=["truc@machin.com", "bidule@chose.fr"], @duration=10, @start_date=2019-01-14 09:00:00 +0100, @title="standup quotidien">

# puts ev.end_date
# => 2019-01-14 09:10:00 +0100

# puts ev.is_past?
# => true

# puts ev.is_future?
# => false

# puts ev.is_soon?
# => false

# puts ev.to_s

# binding.pry
