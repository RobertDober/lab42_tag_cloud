# DO NOT EDIT!!!
# This file was generated from "README.md" with the speculate_about gem, if you modify this file
# one of two bad things will happen
# - your documentation specs are not correct
# - your modifications will be overwritten by the speculate rake task
# YOU HAVE BEEN WARNED
RSpec.describe "README.md" do
  # README.md:45
  context "The DSL" do
    # README.md:54
    include Lab42::TagCloud
    
    let(:blue_bold) { "blue 10 800" }
    let(:dgr_shaded) { "10/darkgoldenrod 1.2em" }
    let(:explicit) { "6/#2f3ab0 30px 450" }
    it "the `to_style` method will yield the following results (README.md:63)" do
      expect(to_style(blue_bold)).to eq("color: #0000ff; font-size: 10pt; font-weight: 800;")
      expect(to_style(dgr_shaded)).to eq("color: #995061; font-size: 1.2em;")
      expect(to_style(explicit)).to eq("color: #695676; font-size: 30px; font-weight: 450;")
    end
    # README.md:69
    context "Colors" do
      # README.md:72
      include Lab42::TagCloud
      it "we can see some transformation for colors, e.g. shade 11 of black can be expressed in different ways (README.md:77)" do
        gray = "525252"
        expect(color_value(11)).to eq(gray)
        expect(color_value("11")).to eq(gray)
        expect(color_value("11/black")).to eq(gray)
        expect(color_value("11/#000000")).to eq(gray)
      end
      it "we can also use all web color names (README.md:86)" do
        expect(color_value("10/blue")).to eq("7171ff")
        expect(color_value("10/lime")).to eq("71ff71")
      end
      it "we can add underscores for readability to the color names (README.md:92)" do
        expect(color_value("4/medium_slate_blue")).to eq("0d16e0")
      end
    end
    # README.md:96
    context "Convenience Helpers" do
    end
  end
end