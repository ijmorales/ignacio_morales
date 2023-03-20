module Statusable
  extend ActiveSupport::Concern

  included do
    def self.status(states:)
      enum status: states
    end
  end
end