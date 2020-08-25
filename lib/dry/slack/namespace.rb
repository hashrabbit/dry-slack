# frozen_string_literal: true

require 'dry/container'

module Dry
  module Slack
    Namespace = Dry::Container::Namespace.new(:dry_slack) do
      register(:publish_webhook) { Dry::Slack::PublishWebhook }

      namespace(:blocks) do
        register(:button) { Dry::Slack::Blocks::Button }
        register(:confirm) { Dry::Slack::Blocks::Confirm }
        register(:context) { Dry::Slack::Blocks::Context }
        register(:date_picker) { Dry::Slack::Blocks::DatePicker }
        register(:divider) { Dry::Slack::Blocks::Divider }
        register(:image) { Dry::Slack::Blocks::Image }
        register(:image_block) { Dry::Slack::Blocks::ImageBlock }
        register(:option) { Dry::Slack::Blocks::Option }
        register(:option_group) { Dry::Slack::Blocks::OptionGroup }
        register(:overflow) { Dry::Slack::Blocks::Overflow }
        register(:section) { Dry::Slack::Blocks::Section }
        register(:static_select) { Dry::Slack::Blocks::StaticSelect }
        register(:text) { Dry::Slack::Blocks::Text }
      end

      namespace(:payloads) do
        register(:basic) { Dry::Slack::Payloads::Basic }
      end

      namespace(:events) do
        register(:handler) { Dry::Slack::Events::Handler }
      end
    end
  end
end
