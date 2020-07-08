# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    RSpec.describe PostJson do
      context 'when POSTing succeeds' do
        let(:payload) { Payloads::Basic.new(text: 'Foo') }
        let(:result) { described_class.new.call(payload.to_h.to_json) }

        before do
          stub_request(:post, ENV['SLACK_WEBHOOK'])
            .to_return(status: 200, body: 'Ok', headers: {})
        end

        it 'returns a Success' do
          expect(result).to be_success
        end
      end

      context 'when POSTing fails' do
        let(:fail_client) { double(:fail_client) }
        let(:result) {
          described_class.new(http: fail_client).call({}.to_json)
        }
        let(:response) { double(:response, response: :failed) }
        let(:http_error) { RestClient::ExceptionWithResponse.new(response) }

        before do
          allow(fail_client).to receive(:post).and_raise(http_error)
        end

        it 'returns a Failure, wrapping a PostFailed error' do
          expect(result).not_to be_success
          expect(result.failure).to be_a(PostFailed)
        end
      end
    end
  end
end
