# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class ImageBlock < Block
        attribute? :type, Types.type_string(0, 'image')
        attribute :image_url, Types::UrlString
        attribute :alt_text, Types::AltString
        attribute? :title, Blocks::Text
        attribute? :block_id, Types::IdString
      end
    end
  end
end
