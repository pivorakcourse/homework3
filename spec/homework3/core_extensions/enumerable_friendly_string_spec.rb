# frozen_string_literal: true

require 'spec_helper'

describe Homework3::CoreExtensions::EnumerableFriendlyString do
  # Task #2 String open class. We all kno Ennumerable module wich gives us
  # a functionality like
  # ['1', '2'].map { |number| number.to_i }
  # It also can be invoked with shorter syntax: ['1', '2'].map(&:to_i)
  # But if we change :to_i (Symbol) and write ['1', '2'].map(&'to_i') (String)
  # we get an error:
  # TypeError: wrong argument type String (expected Proc)
  # In this task it is needed to monkeypatch class String to have tests passed

  specify { expect(%w[1 2].map(&'to_i')).to match_array [1, 2] }
  specify { expect([1, 2].any?(&'nil?')).to be false }
  specify { expect([nil, nil].all?(&'nil?')).to be true }
  specify { expect([1, 2, 3, 4, 5].inject(&'+')).to eq 15 }
  specify { expect([1, 2, 3, 4, 5].map(&'to_s')).to match_array %w[1 2 3 4 5] }
  specify { expect([].map(&'to_i')).to match_array [] }
end
