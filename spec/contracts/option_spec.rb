# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Option do
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid Option block' do
          let(:block) { option }

          it 'returns success' do
            expect(result).to be_success
          end
        end
      end
    end
  end
end
