require 'resolver'

describe Resolver do
  describe "execute" do
    it "correct sample 1" do
      result = described_class.new(10, [3, 4, 5, 6, 7]).execute
      expected = [[3, 7], [4, 6]]

      expect(result).to eq(expected)
    end

    it "correct sample 2" do
      result = described_class.new(8, [3, 4, 5, 4, 4]).execute
      expected = [[3, 5]]

      expect(result).to eq(expected)
    end

    it "return empty array" do
      result = described_class.new(10, [1, 1, 1, 1, 1]).execute
      expected = []

      expect(result).to eq(expected)
    end
  end
end
