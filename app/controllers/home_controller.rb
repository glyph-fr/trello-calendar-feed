class HomeController < ApplicationController
  def index
    redirect_to feeds_path if user_signed_in?
  end
end
