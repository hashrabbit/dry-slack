# frozen_string_literal: true

module Dry
  module Slack
    module Blocks
      class Block < Dry::Struct
        def validate
          name_sym = self.class.name.split(/::/)[-1].to_sym
          @validate ||= Contracts.const_get(name_sym).new.call(attributes)
        end
      end
    end
  end
end
