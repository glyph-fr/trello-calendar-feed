class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def trello_client
    return unless user_signed_in?
    @trello_client ||= Trello::Client.new(
      consumer_key: ENV['TRELLO_KEY'],
      consumer_secret: ENV['TRELLO_SECRET'],
      oauth_token: current_user.trello_token,
      oauth_token_secret: current_user.trello_secret
    )
  end

  def current_trello_user
    return unless user_signed_in?
    @current_trello_user ||= trello_client.find(:member, current_user.uid)
  end
end
