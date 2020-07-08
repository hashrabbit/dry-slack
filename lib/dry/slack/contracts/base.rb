# frozen_string_literal: true

module Dry
  module Slack
    module Contracts
      class Base < Dry::Validation::Contract
        register_macro(:is_valid) do
          keys.each do |name|
            next if values[name].nil?

            key(name).failure('is invalid') if values[name].validate.failure?
          end
        end

        register_macro(:is_plain) do
          keys.each do |name|
            next if values[name].nil?
            next if values[name]&.plain_text?

            key(name).failure("must be a type: 'plain_text'")
          end
        end

        register_macro(:is_plain_option) do
          msg = ":text must be type: 'plain_text'"
          key.failure(msg) if key? && !value[:text].plain_text?
        end

        register_macro(:length_lte) do |macro:|
          len = macro.args[0]
          msg = "must be <= #{len} characters"
          keys.each do |name|
            next if values[name].nil?

            key(name).failure(msg) unless values[name].length?(len)
          end
        end

        register_macro(:invalid_for_attr) do |macro:|
          name, val = *macro.args[0].flatten
          msg = "is invalid for #{name}: '#{val}'"
          key.failure(msg) if key? && values[name] == val
        end

        register_macro(:at_least_one) do |macro:|
          one, two = *macro.args
          msg = "At least one of :#{one} or :#{two} must be defined"
          base.failure(msg) unless values[one] || values[two]
        end
      end
    end
  end
end
