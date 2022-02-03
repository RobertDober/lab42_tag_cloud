# frozen_string_literal: true

require_relative "colors/names"
module Lab42
  module TagCloud
    module Colors extend self
      def gamma_correct(color)
      end

      NAMED_COLOR_RGX = %r<\A (\d\d?) / (\w+) \z>x
      SIMPLE_SCALE_RGX = %r<\A \d\d? \z>x
      HEX_SCALE_RGX = %r<\A (\d\d?) / \# (\h{6}) \z>x

      def parse_color(color)
        case
        when match = SIMPLE_SCALE_RGX.match(color)
          _simple_scale(match)
        when match = NAMED_COLOR_RGX.match(color)
          _named_scale(match)
        when match = HEX_SCALE_RGX.match(color)
          [match[1].to_i, match[2]]
        else
          raise ArgumentError, "illegal color spec #{color}"
        end
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
