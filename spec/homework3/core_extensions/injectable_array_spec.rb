# frozen_string_literal: true

require 'spec_helper'

describe Homework3::CoreExtensions::InjectableArray do
  # It is needed to have simple version of inject. Yeah, we need more bisycles!
  describe '#simple_inject' do
    # Too complicated ceses
    # specify { expect([1, 2].inject(:+) {}).to be_nil }
    # specify { expect([1, 2].simple_inject(:+)).to eq 3 }
    # specify { expect((5..10).simple_inject(1, :*)).to eq 151_200 }
    # specify { expect { [1].simple_inject(0) }.to raise_error(TypeError) }
    # specify { expect([].simple_inject).to be_nil }
    # specify do
    #   expect { [1, 2, 3].inject(:+) { |result, x| result + x } }.
    #     to raise_error(NoMethodError)
    # end

    let(:array) { [1] }

    it 'does not receive original inject' do
      expect(array).not_to receive(:inject)

      array.simple_inject(0) { |result, x| result + x }
    end

    it 'is not implemented via alias' do
      expect(array.method(:simple_inject).original_name).not_to eq(:inject)
    end

    specify { expect([].simple_inject(0) {}).to be_zero }
    specify { expect([].simple_inject {}).to be_nil }
    specify { expect(array.simple_inject(0) {}).to be_nil }

    specify do
      expect(array.simple_inject(0) { |result, x| result + x }).to eq 1
    end

    specify do
      expect(array.simple_inject(-1) { |result, x| result + x }).to be_zero
    end

    specify do
      expect(%w[1 2].simple_inject('hello') { |result, x| result + x }).
        to eq 'hello12'
    end

    specify do
      expect([1, 2, 3, 4].simple_inject(0) { |result, x| result + x }).to eq 10
    end

    specify do
      expect(
        %w[cat sheep bear].inject do |memo, word|
          memo.length > word.length ? memo : word
        end
      ).to eq 'sheep'
    end
  end
end
