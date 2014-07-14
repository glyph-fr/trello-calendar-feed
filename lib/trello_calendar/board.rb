module TrelloCalendar
  class Board < TrelloCalendar::Base
    attr_reader :board_id

    def initialize(trello_client, board_id)
      @trello_client = trello_client
      @board_id = board_id
    end

    private

    def cards
      @cards ||= board.cards
    end

    def board
      @board ||= trello_client.find(:board, board_id)
    end
  end
end
