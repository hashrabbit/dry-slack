# frozen_string_literal: true

require 'dry/matcher'
require 'dry/matcher/result_matcher'

module DoService
  def self.included(klass)
    klass.include Dry::Monads[:result, :try]
    klass.include Dry::Monads::Do.for(:call)
    klass.include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
  end

  def TryResult(*exs, &block)
    catchable = exs.empty? ? Dry::Monads::Try::DEFAULT_EXCEPTIONS : exs.flatten
    Dry::Monads::Try.run(catchable, block).to_result
  end
end
