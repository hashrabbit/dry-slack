# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class PayloadBasic < Base
        schema do
          optional(:text)
          optional(:blocks).value(:array, max_size?: 50)
        end

        rule(:blocks).each(:is_valid)

        rule.validate(at_least_one: %i[text blocks])
      end
    end
  end
end
