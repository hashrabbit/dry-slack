# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Section < Base
        schema do
          optional(:text)
          optional(:fields).value(:array, max_size?: 10)
          optional(:accessory)
        end

        rule(:text, :accessory).validate(:is_valid)
        rule(:fields).each(:is_valid)

        rule.validate(at_least_one: %i[text fields])
      end
    end
  end
end
