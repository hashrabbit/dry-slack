# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe StaticSelect do
        let(:group) {
          Blocks::OptionGroup.new(label: text_plain, options: option)
        }
        let(:block) { Blocks::StaticSelect.new(options) }
        let(:result) { described_class.new.call(block.attributes) }
        let(:errors) { result.errors }

        context 'with valid attributes' do
          let(:options) {
            { placeholder: text_mrkdwn, action_id: 'id', options: option }
          }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'with both :options and :option_groups' do
          let(:options) {
            {
              placeholder: text_mrkdwn, action_id: 'id', options: option,
              option_groups: group
            }
          }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[nil]).to match([/\AOnly one of .+ can be defined/])
          end
        end

        context 'with neither :options nor :option_groups' do
          let(:options) { { placeholder: text_mrkdwn, action_id: 'id' } }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[nil]).to match([/\AOnly one of .+ can be defined/])
          end
        end
      end
    end
  end
end
