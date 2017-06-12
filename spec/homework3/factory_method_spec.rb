# frozen_string_literal: true

require 'spec_helper'

describe Homework3::FactoryMethod do
  # It is common case to have classes that look like modules from the outside.
  # For example, if we have a class

  # class Calculator
  #   def self.cost(*args)
  #     new(*args).cost
  #   end

  #   ...

  #   def cost
  #     ...
  #   end
  # end

  # then the code
  #       cost = Calculator.new(price: 22, tax_rate: 0.2).cost
  # may be rewritten into:
  #       cost = Calculator.cost(price: 22, tax_rate: 0.2)
  # which is much clearer.

  # Your team asked you to write a module which will help you
  # to define such factory class methods on the fly:

  # class Calculator
  #   include Homework3::FactoryMethod[:cost]

  #   def cost
  #     ...
  #   end
  # end

  context 'no params' do
    let(:klass) do
      Class.new do
        include Homework3::FactoryMethod[:cost]

        def cost
          40
        end
      end
    end

    it { expect(klass.cost).to eq 40 }
  end

  context 'multiple params' do
    let(:klass) do
      Class.new do
        include Homework3::FactoryMethod[:multiply]

        def initialize(price, count)
          @price = price
          @count = count
        end

        def multiply
          price * count
        end

        private

        attr_reader :price, :count
      end
    end

    it { expect(klass.multiply(10, 32)).to eq 320 }
  end

  context 'stateless' do
    let!(:klass_1) do
      Class.new do
        include Homework3::FactoryMethod[:cost]

        def cost
          40
        end
      end
    end

    let!(:klass_2) do
      Class.new do
        include Homework3::FactoryMethod

        def cost
          40
        end
      end
    end

    it { expect(klass_2).not_to respond_to(:cost) }
  end
end
