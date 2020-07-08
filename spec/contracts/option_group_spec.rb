# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe OptionGroup do
        let(:block) { Blocks::OptionGroup.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid OptionGroup block' do
          let(:options) { { label: text_plain, options: option } }

          it 'returns success' do
            expect(result).to be_success
          end
        end
      end
    end
  end
end
