# frozen_string_literal: true

module Dry
  module Slack
    module Events
      class ParseRequest
        extend Dry::Initializer
        include DoService

        option :request_struct, default: proc { RequestStruct }

        def call(request)
          yield valid_method(request)
          yield valid_type(request.content_type)
          to_struct(request).tee { |struct| valid_body(struct) }
        end

        private

        def valid_method(request)
          request.post? ? Success() : failure(405, 'Method not allowed')
        end

        def valid_type(type)
          type == 'application/json' ? Success() : failure(400, 'Bad Request')
        end

        def valid_body(struct)
          TryResult(JSON::ParserError) { struct.to_h }
            .or(failure(400, 'Request Body not JSON'))
        end

        def to_struct(request)
          TryResult(Dry::Struct::Error) { request_struct.call(request) }
            .or(failure(400, 'Invalid Request'))
        end

        def failure(code, text)
          Error.call(code, text).to_result
        end
      end
    end
  end
end
