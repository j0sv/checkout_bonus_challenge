require './lib/checkout.rb'

describe Checkout do
  it 'should have a collection of products' do
    expect(subject.products).to be_an_instance_of(Array)
  end

end
