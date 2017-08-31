require './lib/checkout.rb'

describe Checkout do
  it 'should have a collection of products' do
    expect(subject.products).to be_an_instance_of(Array)
  end

  it 'should have an empty basket on init' do
    expect(subject.basket).to match_array([])
  end

  it 'should be able to add items to basket' do
    subject.shop(0)
    expect(subject.basket).to match_array([{:item=>{:name=>"Lavender heart", :price=>9.25, :code=>0}}])
    expect{subject.shop(0)}.to output("You have added Lavender heart (price: $9.25).\n").to_stdout
  end

  it 'should be able to get a total' do
    subject.shop(0)
    expect{subject.total_cost}.to output("Your total is: $9.25.\n").to_stdout
  end

  it 'should be able to have promotions' do
    expect(subject.promotions).to be_an_instance_of(Array)
  end

  it 'should give 10% off if total > $60' do
    subject.shop(0)
    subject.shop(1)
    subject.shop(2)
    expect{subject.total_cost}.to output("Your total is: $66.78.\n").to_stdout
  end
end
