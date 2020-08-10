# frozen_string_literal: true

require 'json'
require 'rest-client'
require 'dry-initializer'
require 'dry-monads'
require 'dry/monads/do'
require 'dry-types'
require 'dry-struct'
require 'dry-validation'

Dry::Validation.load_extensions(:monads)

module Dry
  module Slack
    class Error < StandardError
    end

    class PostFailed < Error
      def initialize(error)
        super("Slack Publish Failed: #{error}")
      end
    end

    class InvalidAppMention < Error
      def initialize(*)
        super('Invalid app_mention command')
      end
    end

    module Types
      include Dry.Types()

      FilledString = String.constrained(min_size: 1)
      IdString = String.constrained(max_size: 255)
      UrlString = String.constrained(max_size: 3000)
      AltString = String.constrained(max_size: 2000)
      DateString = String.constructor { |v| ::Date.parse(v.to_s).to_s }
      TimeString = Time.constructor { |v| ::Time.at(v.to_i) }

      def self.type_string(def_pos, *vals)
        String.default(vals[def_pos].freeze).enum(*vals)
      end
    end
  end
end

require 'dry/do_service'

require 'dry/slack/blocks'
require 'dry/slack/contracts'
require 'dry/slack/events'
require 'dry/slack/payloads'
require 'dry/slack/post_json'
require 'dry/slack/publish_webhook'
