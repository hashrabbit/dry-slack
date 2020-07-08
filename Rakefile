# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: :spec

task :env do
  require 'dotenv'
  Dotenv.load

  require_relative 'lib/dry/slack'
end

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:lint) { |t| t.options = ['--fail-level', 'fatal'] }

namespace :examples do
  desc 'Publish a simple text payload to Slack Webhook'
  task simple: :env do |_, _|
    p Dry::Slack::PublishWebhook.new.call(
      Dry::Slack::Payloads::Basic.new(text: 'Testing dry-slack basic text payload')
    )
  end

  namespace :sections do
    desc 'Publish a section with an accessory'
    task with_accessory: :env do |_, _|
      one = Dry::Slack::Blocks::Text.new(text: 'Option 1', type: 'plain_text')
      two = Dry::Slack::Blocks::Text.new(text: 'Option 2', type: 'plain_text')
      section = Dry::Slack::Blocks::Section.new(
        text: Dry::Slack::Blocks::Text.new(text: 'Section w/Overflow accessory'),
        accessory: Dry::Slack::Blocks::Overflow.new(
          action_id: 'choices_111',
          options: [
            Dry::Slack::Blocks::Option.new(text: one, value: '1'),
            Dry::Slack::Blocks::Option.new(text: two, value: '2')
          ]
        )
      )
      p Dry::Slack::PublishWebhook.new.call(
        Dry::Slack::Payloads::Basic.new(blocks: section)
      )
    end

    desc 'Publish a section with fields'
    task with_fields: :env do |_, _|
      one = Dry::Slack::Blocks::Text.new(text: "*Field 1*\nText 1")
      two = Dry::Slack::Blocks::Text.new(text: "*Field 2*\nText 2")
      section = Dry::Slack::Blocks::Section.new(
        text: Dry::Slack::Blocks::Text.new(text: 'Section with fields'),
        fields: [one, two]
      )
      p Dry::Slack::PublishWebhook.new.call(
        Dry::Slack::Payloads::Basic.new(blocks: section)
      )
    end
  end
end
