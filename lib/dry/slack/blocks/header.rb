# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Header < Block
        attribute :text, Blocks::Text
        attribute? :type, Types.type_string(0, 'header')
        attribute? :block_id, Types::IdString
      end
    end
  end
end
