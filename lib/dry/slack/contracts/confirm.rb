# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Confirm < Base
        schema do
          required(:title)
          required(:text)
          required(:confirm)
          required(:deny)
        end

        rule(:title, :text, :confirm, :deny).validate(:is_valid)
        rule(:title, :confirm, :deny).validate(:is_plain)

        rule(:title).validate(length_lte: 100)
        rule(:text).validate(length_lte: 300)
        rule(:confirm, :deny).validate(length_lte: 30)
      end
    end
  end
end
