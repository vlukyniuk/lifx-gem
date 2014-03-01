require 'spec_helper'

module LIFX
  describe Light, integration: true do
    describe '#set_color' do
      it "sets the color of the light" do
        color = Color.hsb(rand(360), rand, rand)
        light.set_color(color, 0)
        sleep 0.26
        light.refresh
        flush
        wait_until { light.color == color }
        light.color.should == color
      end
    end

    describe '#set_label' do
      it "sets the label of the light" do
        label = light.label.sub(/\d+|$/, rand(100).to_s)
        light.set_label(label)
        wait_until { light.label == label }
        light.label.should == label
      end
    end

  end
end