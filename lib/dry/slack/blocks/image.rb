# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Image < Block
        attribute? :type, Types.type_string(0, 'image')
        attribute :image_url, Types::UrlString
        attribute :alt_text, Types::AltString
      end
    end
  end
end
