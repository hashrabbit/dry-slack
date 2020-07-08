# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Confirm do
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid confirm object' do
          let(:block) { confirm }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Confirm with a too long :deny attribute' do
          let(:block) {
            Blocks::Confirm.new(
              title: text_plain, text: text_plain, confirm: text_plain,
              deny: text_plain_gt75
            )
          }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:deny]).to match([/\Amust be <= 30/])
          end
        end
      end
    end
  end
end
