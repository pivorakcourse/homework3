# frozen_string_literal: true

require 'spec_helper'

describe Homework3::Extender do
  # Imagine you don't have Module#extend method.
  # But your team extremely need this functionality.
  # So, you desided to create a module Extender with will do the next:
  # Extender.call(ClassIWantToExtend, MyModule)
  # Do this without using original .extend method
  describe '.call' do
    let(:klass) { Class.new }
    let(:my_module) do
      Module.new do
        def my_method
          1
        end
      end
    end

    subject(:call) { described_class.call(klass, my_module) }

    context 'no cheating' do
      it 'does not use .extend to get the functionality' do
        expect(klass).not_to receive(:extend)

        call
      end
    end

    context 'functionality' do
      before { call }

      it 'inherits module methods as class methods' do
        expect(klass.my_method).to eq 1
      end

      it 'does not inherit module methods as instance methods' do
        expect { klass.new.my_method }.to raise_error(NoMethodError)
      end
    end
  end
end
