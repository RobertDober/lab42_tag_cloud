# frozen_string_literal: true

require_relative "colors/names"
module Lab42
  module TagCloud
    module Colors
      extend self

      COLOR_RGX = /\A (..) (..) (..) \z/x
      SCALES = 12
      GAMMA = 2.2

      def gamma_correct((scale, color))
        COLOR_RGX
          .match(color)
          .captures
          .map(&_gamma_corrected_octet(scale))
          .join
      end

      NAMED_COLOR_RGX = %r{\A (\d\d?) / (\w+) \z}x
      SIMPLE_SCALE_RGX = /\A \d\d? \z/x
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

      private

      def _gamma_corrected_octet(scale)
        ->(octet) do
          inv_c = octet.to_i(16)
          scaled = (255 - inv_c) * (((SCALES - scale).to_f/SCALES) ** (1.0/GAMMA))
          value = (inv_c - scaled.round).abs.round
          "%02x" % value
        end
      end

      def _simple_scale(match)
        [match.to_s.to_i, "000000"]
      end

      def _named_scale(match)
        [match[1].to_i, Names.get_color(match[2])]
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
