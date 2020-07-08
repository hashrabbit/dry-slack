# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Option < Block
        attribute :text, Blocks::Text
        attribute :value, Types::String.constrained(max_size: 75)
        attribute? :description, Blocks::Text
        attribute? :url, Types::UrlString
      end
    end
  end
end
