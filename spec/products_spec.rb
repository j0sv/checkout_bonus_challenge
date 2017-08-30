require './lib/product_range.rb'

describe ProductRange do
  it 'should have a collection of products' do
    expect(subject.products).to be_an_instance_of(Array)
  end
end
