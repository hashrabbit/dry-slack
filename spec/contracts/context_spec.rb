# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Context do
        let(:block) { Blocks::Context.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Context block' do
          let(:options) { { elements: text_mrkdwn } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for an Context with an invalid :elements attribute' do
          let(:options) { { elements: text_invalid } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:elements][0]).to match([/\Ais invalid/])
          end
        end
      end
    end
  end
end
