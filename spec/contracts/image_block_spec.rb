# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe ImageBlock do
        let(:block) { Blocks::ImageBlock.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'for a valid ImageBlock' do
          let(:options) {
            { image_url: url_string, alt_text: 'image', title: text_plain }
          }

          it 'returns success' do
            expect(result).to be_success
          end
        end
      end
    end
  end
end
