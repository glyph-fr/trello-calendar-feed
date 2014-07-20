class BoardsController < ApplicationController
  def index
    @organization = trello_client.find(:organizations, params[:organization_id])
    @boards = @organization.boards
  end
end
