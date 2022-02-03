# frozen_string_literal: true

require_relative "colors"
module Lab42
  module TagCloud
    module Compiler
      extend self
      def color_value(color_spec)
        parsed = Colors.parse_color(color_spec)
        Colors.gamma_correct(parsed)
      end

      def make_attributes(color, size, weight = nil)
        color = "##{color_value(color)}"
        font_size = _normalize_size(size)
        font_weight = _maybe_weight(weight)
        attributes = { color:, font_size: }.merge(font_weight)
        _format_attributes(**attributes)
      end

      private

      def _format_attribute(k, v)
        "#{k}: #{v}".gsub("_", "-")
      end

      def _format_attributes(**atts)
        atts
          .inject([]) { |r, (k, v)| r << _format_attribute(k, v) }
          .join("; ") << ";"
      end

      def _maybe_weight(weight)
        return {} unless weight

        { font_weight: weight }
      end

      DEFAULT_SIZE_RGX = / \A \d+ \z /x
      def _normalize_size(size)
        case size
        when DEFAULT_SIZE_RGX
          "#{size}pt"
        else
          size
        end
      end
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
