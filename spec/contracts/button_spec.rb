# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Button do
        let(:block) { Blocks::Button.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Button block' do
          let(:options) { { text: text_plain, action_id: 'id' } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Button with a non-plain_text :text attribute' do
          let(:options) { { text: text_mrkdwn, action_id: 'id' } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:text]).to match([/type: 'plain_text'\z/])
          end
        end

        context 'for a Button with a too long :text attribute' do
          let(:options) { { text: text_plain_gt75, action_id: 'id' } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:text]).to match([/\Amust be <= 75/])
          end
        end

        context 'for a Button with an invalid :text attribute' do
          let(:options) { { text: text_plain_invalid, action_id: 'id' } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:text]).to eq(['is invalid'])
          end
        end

        context 'for a Button with an invalid :confirm attribute' do
          let(:options) {
            { text: text_plain, action_id: 'id', confirm: confirm_invalid }
          }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:confirm]).to eq(['is invalid'])
          end
        end
      end
    end
  end
end
