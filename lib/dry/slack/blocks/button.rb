# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Button < Block
        attribute :action_id, Types::IdString
        attribute :text, Blocks::Text
        attribute? :type, Types.type_string(0, 'button')
        attribute? :url, Types::UrlString
        attribute? :value, Types::AltString
        attribute? :style, Types::String.enum('primary', 'danger')
        attribute? :confirm, Blocks::Confirm
      end
    end
  end
end
