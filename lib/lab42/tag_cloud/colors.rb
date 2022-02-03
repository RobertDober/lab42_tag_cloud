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

      HEX_COLOR_RGX = %r<\A (?: (?<scale> \d\d? ) / )? \# (?<hex> \h{6} ) \z>x
      NAMED_COLOR_RGX = %r{\A (?: (?<scale> \d\d? ) / )? (?<color_name> \w+ ) \z}x
      SCALE_RGX = /\A \d\d? \z/x

      def parse_color(color)
        case
        when match = SCALE_RGX.match(color)
          _gray_scale(match)
        when match = HEX_COLOR_RGX.match(color)
          _hex_color(match)
          [match[1].to_i, match[2]]
        when match = NAMED_COLOR_RGX.match(color)
          _named_scale(match)
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

      def _gray_scale(match)
        [match.to_s.to_i, "000000"]
      end

      def _hex_color(match)
        [(match[:scale] || 12).to_i, match[:hex]]
      end

      def _named_scale(match)
        [(match[:scale] || 12).to_i, Names.get_color(match[:color_name])]
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
