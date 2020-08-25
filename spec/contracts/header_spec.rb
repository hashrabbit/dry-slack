# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Header do
        let(:block) { Blocks::Header.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Header' do
          let(:options) { { text: text_plain } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Header with non-plain_text :text attribute' do
          let(:options) { { text: text_mrkdwn } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:text]).to match([/type: 'plain_text'\z/])
          end
        end
      end
    end
  end
end
