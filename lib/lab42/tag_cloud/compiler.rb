# frozen_string_literal: true

require_relative "colors"
module Lab42
  module TagCloud
    module Compiler extend self
      def color_value(color_spec)
        parsed = Colors.parse_color(color_spec)
        Color.gamma_correct(parsed)
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
