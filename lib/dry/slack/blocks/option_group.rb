# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class OptionGroup < Block
        attribute :label, Blocks::Text
        attribute :options, Types::Coercible::Array.of(Blocks::Option)
      end
    end
  end
end
