# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Events
      RSpec.describe ParseRequest do
        let(:args) { [Time.now.to_i, 'sig', { text: 'foo' }.to_json] }
        let(:request) { Spec::RequestStub.new(*args) }
        let(:result) { described_class.new.call(request) }

        context 'with a vaild POST Request object' do
          it 'returns Success, wrapping a RequestStruct' do
            expect(result).to be_success
            expect(result.value!).to be_a(RequestStruct)
          end
        end

        context 'with a non-POST Request object' do
          let(:request) {
            Spec::RequestStub.new(*args.push('application/json', false))
          }

          it 'returns Failure, wrapping a "Method not allowed" Error' do
            expect(result).to be_failure
            expect(result.failure.text).to eq 'Method not allowed'
          end
        end

        context 'with a invalid content-type Request object' do
          let(:request) { Spec::RequestStub.new(*args.push('foo')) }

          it 'returns Failure, wrapping a "Bad Request" Error' do
            expect(result).to be_failure
            expect(result.failure.text).to eq 'Bad Request'
          end
        end

        context 'with a Request object containing an invalid attribute type' do
          let(:args) { [Time.now.to_i, :sig, { text: 'foo' }.to_json] }

          it 'returns Failure, wrapping a "Invalid Request" Error' do
            expect(result).to be_failure
            expect(result.failure.text).to eq 'Invalid Request'
          end
        end

        context 'with a Request object containing a non-JSON body' do
          let(:args) { [Time.now.to_i, 'sig', 'foo'] }

          it 'returns Failure, wrapping a "Body not JSON" Error' do
            expect(result).to be_failure
            expect(result.failure.text).to match 'Body not JSON'
          end
        end
      end
    end
  end
end
