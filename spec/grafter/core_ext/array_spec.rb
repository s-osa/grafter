require "spec_helper"

describe Array do
  describe "Array#graft" do
    context "depth = 1" do
      before do
        @samples = []
        @samples << Sample.new("a1","b1")
        @samples << Sample.new("a1","b2")
        @samples << Sample.new("a2","b1")
      end

      it "should merge elements in receiver array" do
        samples = @samples.graft(operator: :===, branch: :children)
        expect(samples.size).to eq(2)
        expect(samples[0].children.size).to eq(2)
      end

      it "should raise error invalid operator" do
        expect{@samples.graft(operator: :nomethod, branch: :chiildren)}.to raise_error(NoMethodError)
      end

      it "should raise error invalid branch" do
        expect{@samples.graft}.to raise_error(NoMethodError)
        expect{@samples.graft(branch: :nomethod)}.to raise_error(NoMethodError)
      end
    end
  end
end
