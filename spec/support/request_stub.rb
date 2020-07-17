# frozen_string_literal: true

module Dry
  module Slack
    module Spec
      class RequestStub
        attr_reader :body, :content_type

        def initialize(time, sig, body, type = 'application/json', post = true)
          @body = StringIO.new(body)
          @content_type = type
          @post = post
          @headers = {
            'HTTP_X_SLACK_REQUEST_TIMESTAMP' => time,
            'HTTP_X_SLACK_SIGNATURE' => sig
          }
        end

        def get_header(name)
          @headers.fetch(name)
        end

        def post?
          @post == true
        end
      end
    end
  end
end
