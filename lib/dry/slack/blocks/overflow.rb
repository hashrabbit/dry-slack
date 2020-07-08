# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Overflow < Block
        attribute :action_id, Types::IdString
        attribute? :type, Types.type_string(0, 'overflow')
        attribute? :options, Types::Coercible::Array.of(Blocks::Option)
        attribute? :confirm, Blocks::Confirm
      end
    end
  end
end
