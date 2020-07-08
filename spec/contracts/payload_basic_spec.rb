# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe PayloadBasic do
        let(:payload) { Payloads::Basic.new(options) }
        let(:result) { described_class.new.call(payload.attributes) }
        let(:errors) { result.errors }

        context 'for a Payload with a valid :text attribute' do
          let(:options) { { text: 'Foo' } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Payload without either :text or :blocks attributes' do
          let(:options) { {} }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[nil]).to match([/At least one .* must be defined/])
          end
        end
      end
    end
  end
end
