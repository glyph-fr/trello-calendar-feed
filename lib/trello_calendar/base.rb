module TrelloCalendar
  class Base
    attr_reader :trello_client

    def to_ics
      calendar = Icalendar::Calendar.new

      dated_cards.each do |card|
        calendar.event do |e|
          e.dtstart     = Icalendar::Values::DateTime.new(card.due)
          e.dtend       = Icalendar::Values::DateTime.new(card.due + 1.hour)
          e.summary     = card.name
          e.description = card.desc
          e.ip_class    = "PRIVATE"
        end
      end

      calendar.publish

      calendar.to_ical
    end

    private

    def cards
      raise "implement #cards method in subclass"
    end

    def dated_cards
      @dated_cards ||= cards.select do |card|
        card.due
      end
    end

    def ical_date_for(datetime)

    end
  end
end
