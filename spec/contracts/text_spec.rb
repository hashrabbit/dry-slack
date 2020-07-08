# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Text do
        let(:text) { Blocks::Text.new(options) }
        let(:result) { described_class.new.call(text.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Text block' do
          let(:options) { { text: 'Foo' } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a "mrkdwn" Text that sets the :emoji attribute' do
          let(:options) { { text: 'Foo', emoji: false } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[:emoji][0]).to match(/\Ais invalid/)
          end
        end
      end
    end
  end
end
