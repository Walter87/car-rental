require 'spec_helper'

describe CarDecorator do
  let(:car) { build :car}
  describe "#full_name" do
    subject { car.decorate.full_name }
    it { is_expected.to eq 'Suzuki Ignis' }
  end
end
