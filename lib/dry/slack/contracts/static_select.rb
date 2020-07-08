# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class StaticSelect < Base
        schema do
          optional(:options).value(:array, max_size?: 100)
          optional(:option_groups).value(:array, max_size?: 100)
          optional(:initial_option)
          optional(:confirm)
        end

        rule(:options).each(:is_valid)
        rule(:option_groups).each(:is_valid)
        rule(:initial_option, :confirm).validate(:is_valid)

        rule do
          unless values[:options].nil? ^ values[:option_groups].nil?
            base.failure(
              'Only one of :options or :option_groups can be defined'
            )
          end
        end
      end
    end
  end
end
