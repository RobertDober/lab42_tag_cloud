# frozen_string_literal: true

require_relative "tag_cloud/compiler"
module Lab42
  module TagCloud
    extend self
    def color_value(color_spec)
      Compiler.color_value(color_spec.to_s)
    end

    def tag_from_object(object, **atts)
      Compiler.tag_from_object(object, **atts)
    end

    def tags_from_collection(collection, before: "", after: "", join: "", **atts)
      collection
        .map { tag_from_object({ dsl: _1[:dsl], tag: [before, _1[:tag], after].join }, **atts) }
        .join(join)
    end

    def to_style(dsl_string)
      Compiler.make_css_attributes(*dsl_string.split)
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
