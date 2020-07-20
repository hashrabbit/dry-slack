# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Events
      RSpec.describe VerifySignature do
        let(:time) { Time.now.to_i }
        let(:body) { { text: 'foo' }.to_json }
        let(:result) { described_class.new.call(struct) }

        context 'for a struct containing a valid signature' do
          let(:struct) { build_struct(time, body, "v0:#{time}:#{body}") }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a request with an invalid Slack signature' do
          let(:struct) { build_struct(time, body, 'text=foo') }

          it 'returns failure, with Invalid Signature' do
            expect(result).not_to be_success
            expect(result.failure.text).to eq 'Invalid Signature'
          end
        end

        def build_struct(time, body, sig_body)
          sig = OpenSSL::HMAC.hexdigest('sha256', ENV['SLACK_SECRET'], sig_body)
          stub = Spec::RequestStub.new(time, "v0=#{sig}", body)
          RequestStruct.call(stub)
        end
      end
    end
  end
end
