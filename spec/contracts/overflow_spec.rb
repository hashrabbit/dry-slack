# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Overflow do
        let(:block) { Blocks::Overflow.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Overflow block' do
          let(:options) {
            { options: [option_plain, option_plain], action_id: 'id' }
          }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Overflow with a non-plain_text :options entry' do
          let(:options) {
            { options: [option_plain, option], action_id: 'id' }
          }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:options][1]).to match([/type: 'plain_text'\z/])
          end
        end
      end
    end
  end
end
