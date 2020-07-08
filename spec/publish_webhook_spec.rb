# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    RSpec.describe PublishWebhook do
      let(:payload) { Payloads::Basic.new(options) }
      let(:success) { Dry::Monads::Result::Success.new(:success) }
      let(:post_json) { double(:post_json, call: success) }
      let(:result) {
        described_class.new(post_json: post_json).call(payload)
      }

      context 'for a valid payload' do
        let(:options) { { blocks: Blocks::Section.new(text: text_mrkdwn) } }

        it 'delivers successfully' do
          expect(result).to be_success
        end
      end

      context 'for an invalid payload' do
        let(:options) { { blocks: Blocks::Section.new(text: text_invalid) } }

        it 'fails to deliver' do
          expect(result).not_to be_success
        end
      end
    end
  end
end
