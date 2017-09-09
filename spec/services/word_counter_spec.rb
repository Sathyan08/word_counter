require 'spec_helper'
require './lib/services/word_counter'

RSpec.describe WordCounter do
  let(:test_string) { "one two Two dos Dos three three Three" }
  let(:expected_result) { {"three" => 3, "dos" => 2, "two" => 2, "one" => 1} }

  describe "#word_count" do
    it "returns a hash ordered by word frequency then alphabetically" do
      expect(subject.execute(test_string)).to eq(expected_result)
    end
  end
end
