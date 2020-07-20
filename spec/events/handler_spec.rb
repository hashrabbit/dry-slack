# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Events
      RSpec.describe Handler do
        include Dry::Monads[:result]

        let(:parse_request) { double(:parse_request, call: Success(struct)) }
        let(:verify_signature) { double(:verify_signature, call: Success()) }
        let(:input) {
          { parse_request: parse_request, verify_signature: verify_signature }
        }
        let(:result) { described_class.new(**input).call(:request) }

        context 'with a Request containing a valid event payload' do
          let(:hash) {
            { type: 'url_verification', token: 'token', challenge: 'challege' }
          }
          let(:struct) { double(:struct, to_h: hash) }

          it 'returns Success, wrapping the instantiated event' do
            expect(result).to be_success
            expect(result.value!).to be_a(UrlVerification)
          end
        end

        context 'with a Request containing an invalid event payload' do
          let(:hash) {
            { type: 'foo_verification', token: 'token', challenge: 'challege' }
          }
          let(:struct) { double(:struct, to_h: hash) }

          it 'returns Failure, wrapping an "Invalid Event Payload" Error' do
            expect(result).to be_failure
            expect(result.failure.text).to eq 'Invalid Event Payload'
          end
        end
      end
    end
  end
end
