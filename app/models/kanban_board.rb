class KanbanBoard < ApplicationRecord
  has_many :cards

  def cards_by_status
    card_hash = cards.group_by(&:status)
    Card.statuses.keys.map do |status|
      [status, card_hash.fetch(status, [])]
    end
  end
end