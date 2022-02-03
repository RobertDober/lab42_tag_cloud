RSpec.describe Lab42::TagCloud::Colors do
  describe "parse_color raises Argument Error" do
    it "if called with bad name" do
      expect{ described_class.parse_color("this_ain't_no_color39") }.to raise_error(ArgumentError)
    end
  end
end
#  SPDX-License-Identifier: Apache-2.0
