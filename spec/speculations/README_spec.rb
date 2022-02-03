# DO NOT EDIT!!!
# This file was generated from "README.md" with the speculate_about gem, if you modify this file
# one of two bad things will happen
# - your documentation specs are not correct
# - your modifications will be overwritten by the speculate rake task
# YOU HAVE BEEN WARNED
RSpec.describe "README.md" do
  # README.md:45
  context "Colors" do
    # README.md:48
    include Lab42::TagCloud
    it "we can see some transformation for colors, e.g. shade 11 of black can be expressed in different ways (README.md:53)" do
      gray = "525252"
      expect(color_value(11)).to eq(gray)
      expect(color_value("11")).to eq(gray)
      expect(color_value("11/black")).to eq(gray)
      expect(color_value("11/#000000")).to eq(gray)
    end
    it "we can also use all web color names (README.md:62)" do
      expect(color_value("10/blue")).to eq("7171ff")
      expect(color_value("10/lime")).to eq("71ff71")
    end
    it "we can add underscores for readability to the color names (README.md:68)" do
      expect(color_value("4/medium_slate_blue")).to eq("0d16e0")
    end
  end
end
