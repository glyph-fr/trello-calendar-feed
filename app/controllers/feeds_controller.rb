class FeedsController < ApplicationController
  # before_action :authenticate_user_with_token!
  before_action :authenticate_user!

  def index
    @organizations = current_trello_user.organizations.sort_by(&:display_name)
  end

  def show
    calendar = TrelloCalendar[calendar_type].new(trello_client, calendar_id)
    render text: calendar.to_ics, mime_type: Mime::Type.new("text/calendar")
  end

  private

  def calendar_type
    @calendar_type ||= [:organization, :board].find do |type|
      params.key?(:"#{ type }_id")
    end
  end

  def calendar_id
    params[:"#{ calendar_type }_id"]
  end
end
