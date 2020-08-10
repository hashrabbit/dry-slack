# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Events
      RSpec.describe AppMention do
        let(:time) { Time.now.to_i }
        let(:attrs) {
          {
            type: 'app_mention', user: 'user', channel: 'channel', ts: time,
            text: text
          }
        }
        let(:result) { described_class.new(attrs) }

        describe '#to_argv' do
          context 'when :text matches the pattern' do
            let(:text) { '<bot> foo bar -h' }

            it 'returns Success, wrapping the command items' do
              expect(result.to_argv).to be_success
              expect(result.to_argv.value!).to eq ['foo', 'bar', '-h']
            end
          end

          context 'when :text does not match the pattern' do
            let(:text) { '<bot>' }

            it 'returns an "Invalid app_mention command" Failure' do
              expect(result.to_argv).to be_failure
              expect(result.to_argv.failure).to match 'Invalid app'
            end
          end
        end

        describe '#to_argv!' do
          context 'when :text matches the pattern' do
            let(:text) { '<bot> foo bar -h' }

            it 'returns the array of command items' do
              expect(result.to_argv!).to eq ['foo', 'bar', '-h']
            end
          end

          context 'when :text does not match the pattern' do
            let(:text) { '<bot>' }

            it 'returns an "Invalid app_mention command" Failure' do
              expect { result.to_argv! }.to raise_error(InvalidAppMention)
            end
          end
        end
      end
    end
  end
end
