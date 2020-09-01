# frozen_string_literal: true

require 'dry/slack/blocks/block'

require 'dry/slack/blocks/text'
require 'dry/slack/blocks/confirm'
require 'dry/slack/blocks/option'
require 'dry/slack/blocks/option_group'

require 'dry/slack/blocks/date_picker'
require 'dry/slack/blocks/button'
require 'dry/slack/blocks/overflow'
require 'dry/slack/blocks/image'
require 'dry/slack/blocks/static_select'

module Dry
  module Slack
    module Types
      ElementBlocks = Blocks::DatePicker | Blocks::Button | Blocks::Overflow |
                      Blocks::Image | Blocks::StaticSelect
      ContextBlocks = Blocks::Text | Blocks::Image
    end
  end
end

require 'dry/slack/blocks/section'
require 'dry/slack/blocks/divider'
require 'dry/slack/blocks/header'
require 'dry/slack/blocks/image_block'
require 'dry/slack/blocks/context'

module Dry
  module Slack
    module Types
      MessageBlock = Blocks::Section | Blocks::Divider | Blocks::Context |
                     Blocks::Header | Blocks::ImageBlock
    end
  end
end
