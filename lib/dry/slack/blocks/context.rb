# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Context < Block
        attribute? :type, Types.type_string(0, 'context')
        attribute :elements, Types::Coercible::Array.of(Types::ContextBlocks)
        attribute? :block_id, Types::IdString
      end
    end
  end
end
