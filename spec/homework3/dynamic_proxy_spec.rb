# frozen_string_literal: true

require 'spec_helper'

describe Homework3::DynamicProxy do
  # It is needed to have an object which returns any key
  #   as a methods (if only the value is not nil)
  # if only that key is not nil
  # Expected API:
  # dynamic_proxy = DynamicProxy.new(a: 1, b: 'b', c: nil, d: false)
  # dynamic_proxy.a => 1
  # dynamic_proxy.b => 'b'
  # dynamic_proxy.c => NoMethodError
  # dynamic_proxy.d => false

  subject(:dynamic_proxy) { described_class.new(params) }

  let(:params) do
    {
      int_value: 1,
      string_value: 'str',
      nil_value: nil,
      false_value: false,
      true_value: true,
      hash_value: { a: 1 },
      'string_int_value' => 1,
      'string_nil_value' => nil
    }
  end

  context 'invoke' do
    specify { expect(dynamic_proxy.int_value).to eq 1 }
    specify { expect(dynamic_proxy.string_value).to eq 'str' }
    specify { expect { dynamic_proxy.nil_value }.to raise_error(NoMethodError) }
    specify { expect(dynamic_proxy.false_value).to eq false }
    specify { expect(dynamic_proxy.true_value).to eq true }
    specify { expect(dynamic_proxy.hash_value).to eq(a: 1) }
    specify { expect(dynamic_proxy.string_int_value).to eq 1 }

    specify do
      expect { dynamic_proxy.string_nil_value }.to raise_error(NoMethodError)
    end

    it 'works correctly with parent classes methods' do
      expect(dynamic_proxy.nil?).to be false
    end
  end

  context 'respond_to?' do
    it { is_expected.to be_respond_to :int_value }
    it { is_expected.to be_respond_to :string_value }
    it { is_expected.to be_respond_to :string_value }
    it { is_expected.not_to be_respond_to :nil_value }
    it { is_expected.to be_respond_to :false_value }
    it { is_expected.to be_respond_to :true_value }
    it { is_expected.to be_respond_to :hash_value }
    it { is_expected.to be_respond_to :string_int_value }
    it { is_expected.not_to be_respond_to :string_nil_value }

    it { is_expected.to be_respond_to :nil? }
  end
end
