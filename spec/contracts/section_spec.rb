# frozen_string_literal: true

require 'spec_helper'

module Dry
  module Slack
    module Contracts
      RSpec.describe Section do
        let(:section) { Blocks::Section.new(options) }
        let(:result) { described_class.new.call(section.attributes) }
        let(:errors) { result.errors }

        context 'for a Section with valid attributes' do
          let(:date_picker) {
            Blocks::DatePicker.new(action_id: 'id', placeholder: text_plain)
          }
          let(:options) { { text: text_mrkdwn, accessory: date_picker } }

          it 'returns success' do
            expect(result).to be_success
          end
        end

        context 'for a Section without either :text or :fields attributes' do
          let(:options) { {} }

          it 'returns failure' do
            expect(result).not_to be_success
            expect(errors[nil]).to match([/\AAt least one .+ must be defined/])
          end
        end
      end
    end
  end
end
