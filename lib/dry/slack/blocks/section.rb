# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Section < Block
        attribute? :type, Types.type_string(0, 'section')
        attribute? :text, Blocks::Text
        attribute? :fields, Types::Coercible::Array.of(Blocks::Text)
        attribute? :accessory, Types::ElementBlocks
        attribute? :block_id, Types::IdString
      end
    end
  end
end
