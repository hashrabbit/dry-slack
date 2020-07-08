# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Confirm < Block
        attribute :title, Blocks::Text
        attribute :text, Blocks::Text
        attribute :confirm, Blocks::Text
        attribute :deny, Blocks::Text
        attribute? :style, Types::String.enum('primary', 'danger')
      end
    end
  end
end
