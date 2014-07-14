module TrelloCalendar
  class Organization < TrelloCalendar::Base
    attr_reader :organization_id

    def initialize(trello_client, organization_id)
      @trello_client = trello_client
      @organization_id = organization_id
    end

    private

    def cards
      @cards ||= organization.boards.each_with_object([]) do |board, list|
        board.cards.each do |card|
          list << card
        end
      end
    end

    def organization
      @organization ||= trello_client.find(:organization, organization_id)
    end
  end
end
