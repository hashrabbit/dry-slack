# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe DatePicker do
        let(:block) { Blocks::DatePicker.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid DatePicker' do
          let(:options) { { action_id: 'id', placeholder: text_plain } }

          it 'returns success' do
            expect(result).to be_success
          end
        end
      end
    end
  end
end
