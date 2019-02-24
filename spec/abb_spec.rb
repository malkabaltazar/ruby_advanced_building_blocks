require "advanced_building_blocks"

describe "#my_each" do
  context "given an array" do
    it "returns array" do
      expect([1, 2].my_each {|x|}).to eql([1, 2])
    end
  end
end

describe "#my_select" do
  context "given a block" do
    it "returns array of elements for which it is true" do
      expect([1, 2].my_select {|x| x == 1}).to eql([1])
    end
  end
end

describe "#my_all?" do
  context "given a block that does not apply to an element" do
    it "returns false" do
      expect([1, 2].my_all? {|x| x == 1}).to eql(false)
    end
  end

  context "given a block that applies to all elements" do
    it "returns true" do
      expect([1, 2].my_all? {|x| x < 3}).to eql(true)
    end
  end
end

describe "#my_any?" do
  context "given a block which applies to an element" do
    it "returns true" do
      expect([1, 2].my_any? {|x| x == 1}).to eql(true)
    end
  end

  context "given a block which does not apply to any elements" do
    it "returns false" do
      expect([1, 2].my_any? {|x| x == 3}).to eql(false)
    end
  end
end

describe "#my_none?" do
  context "given a block that applies to an element" do
    it "returns false" do
      expect([1, 2].my_none? {|x| x == 1}).to eql(false)
    end
  end

  context "given a block that does not apply to an element" do
    it "returns true" do
      expect([1, 2].my_none? {|x| x == 3}).to eql(true)
    end
  end
end

describe "#my_count" do
  context "given an array" do
    it "returns number of elements" do
      expect([1, 2].my_count).to eql(2)
    end
  end

  context "given an argument" do
    it "returns number of elements to which argument is equal" do
      expect([1, 2].my_count(1)).to eql(1)
    end
  end

  context "given a block" do
    it "returns number of elements to whick block applies" do
      expect([1, 2].my_count {|x| x == 1}).to eql(1)
    end
  end
end
