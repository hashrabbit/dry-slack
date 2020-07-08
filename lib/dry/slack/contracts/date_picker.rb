# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class DatePicker < Base
        schema do
          optional(:placeholder)
          optional(:confirm)
        end

        rule(:placeholder, :confirm).validate(:is_valid)
        rule(:placeholder).validate(:is_plain)
      end
    end
  end
end
