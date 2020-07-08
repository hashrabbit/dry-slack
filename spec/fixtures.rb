# frozen_string_literal: true

module Dry
  module Slack
    module Fixtures
      def text_mrkdwn
        @text_mrkdwn ||= Blocks::Text.new(text: 'Text')
      end

      def text_plain
        @text_plain ||= Blocks::Text.new(text: 'Text', type: 'plain_text')
      end

      def text_invalid
        @text_invalid ||= Blocks::Text.new(text: 'Invalid', emoji: false)
      end

      def text_plain_invalid
        @text_plain_invalid ||= Blocks::Text.new(
          text: 'Invalid', type: 'plain_text', verbatim: false
        )
      end

      def text_gt75
        @text_gt75 ||= Blocks::Text.new(text: 'Invalid' * 11)
      end

      def text_plain_gt75
        @text_plain_gt75 ||= Blocks::Text.new(
          text: 'Invalid' * 11, type: 'plain_text'
        )
      end

      def option
        @option ||= Blocks::Option.new(
          text: text_mrkdwn, value: 'opt', description: text_plain
        )
      end

      def option_plain
        @option_plain ||= Blocks::Option.new(
          text: text_plain, value: 'opt', description: text_plain
        )
      end

      def confirm
        @confirm ||= Blocks::Confirm.new(
          title: text_plain, text: text_mrkdwn, confirm: text_plain,
          deny: text_plain
        )
      end

      def confirm_invalid
        @confirm_invalid ||= Blocks::Confirm.new(
          title: text_plain, text: text_invalid, confirm: text_plain,
          deny: text_plain
        )
      end

      def url_string
        @url_string ||= 'https://example.com/image.gif'
      end

      def image
        @image ||= Blocks::Image.new(image_url: url_string, alt_text: 'image')
      end
    end
  end
end
