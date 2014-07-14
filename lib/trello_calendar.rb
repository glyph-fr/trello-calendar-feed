module TrelloCalendar
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Organization
  autoload :Board

  def self.[](type)
    const_get(type.to_s.camelize)
  end
end