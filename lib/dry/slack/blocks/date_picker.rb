# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class DatePicker < Block
        attribute :action_id, Types::IdString
        attribute? :type, Types.type_string(0, 'datepicker')
        attribute? :initial_date, Types::DateString
        attribute? :placeholder, Blocks::Text
        attribute? :confirm, Blocks::Confirm
      end
    end
  end
end
