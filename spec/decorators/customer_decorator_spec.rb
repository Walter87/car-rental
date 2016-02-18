require 'spec_helper'

describe CustomerDecorator do
  let(:customer) {build :customer}
  describe "#full_name" do
    subject { customer.decorate.full_name }
    it { is_expected.to eq 'John Due' }
  end
end
