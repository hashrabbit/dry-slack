# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class StaticSelect < Block
        attribute? :type, Types.type_string(0, 'static_select')
        attribute :placeholder, Blocks::Text
        attribute :action_id, Types::IdString
        attribute? :options, Types::Coercible::Array.of(Blocks::Option)
        attribute? :option_groups,
                   Types::Coercible::Array.of(Blocks::OptionGroup)
        attribute? :initial_option, Blocks::Option
        attribute? :confirm, Blocks::Confirm
      end
    end
  end
end
