# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Divider < Block
        attribute? :type, Types.type_string(0, 'divider')
        attribute? :block_id, Types::IdString
      end
    end
  end
end
