require 'spec_helper'
require './lib/services/word_counter'

RSpec.describe WordCounter do
  let(:test_string) { "one two Two dos Dos three three Three" }
  let(:expected_result) { {"three" => 3, "dos" => 2, "two" => 2, "one" => 1} }
  let(:result) { described_class.execute(test_string) }

  describe "#word_count" do
    context "when given a string without non-word characters" do
      it "returns a hash ordered by word frequency then alphabetically" do
        expect(result).to eq(expected_result)
        expect(result.to_a).to eq(expected_result.to_a)
      end
    end

    context "when given a string containing punctuation or other non-word characters" do
      let(:test_string) { "one, two. Two dos Dos three three Three!" }

      it "removes the non-word characters and returns a hash ordered by word frequency then alphabetically" do
        expect(result).to eq(expected_result)
        expect(result.to_a).to eq(expected_result.to_a)
      end
    end
  end
end
