# frozen_string_literal: true

require_relative "tag_cloud/compiler"
module Lab42
  module TagCloud
    extend self
    def color_value(color_spec)
      Compiler.color_value(color_spec.to_s)
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
