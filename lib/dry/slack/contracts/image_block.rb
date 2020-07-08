# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class ImageBlock < Base
        schema do
          optional(:title)
        end

        rule(:title).validate(:is_valid)
        rule(:title).validate(:is_plain)
        rule(:title).validate(length_lte: 2000)
      end
    end
  end
end
