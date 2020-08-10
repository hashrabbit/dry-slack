# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Events
      RSpec.describe RequestStruct do
        let(:time) { Time.now.to_i }
        let(:body) { { text: 'foo' }.to_json }
        let(:request) { Spec::RequestStub.new(time.to_s, 'Sig', body) }
        let(:result) { described_class.call(request) }

        context 'with a vaild Request object' do
          it 'returns a valid RequestStruct instance' do
            expect(result).not_to be_expired
            expect { result.to_h }.not_to raise_error
          end
        end

        context 'with a too old :timestamp' do
          let(:time) { Time.now.to_i - 301 }

          it 'returns an expired instance' do
            expect(result).to be_expired
          end
        end

        context 'with a :body that does not contain JSON' do
          let(:body) { 'Foo' }

          it 'raises an error when coerced to a hash' do
            expect { result.to_h }.to raise_error(JSON::ParserError)
          end
        end
      end
    end
  end
end
