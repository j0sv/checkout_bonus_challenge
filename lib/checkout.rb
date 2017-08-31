require 'yaml'

class Checkout

  attr_accessor :basket, :products, :promotions, :total

  def initialize
    @basket = []
    @products = YAML.load_file('./lib/product_list.yml')
    @promotions = YAML.load_file('./lib/promotions.yml')
  end

  def shop(index)
    @basket << @products[index]
    puts "You have added #{@products[index][:item][:name]} (price: $#{@products[index][:item][:price]})."
  end

  def total_cost
    length = basket.length
    total = 0
    (0..length-1).each do |x|
    total += basket[x][:item][:price]
    end
    puts "Your total is: $#{total}."
  end
end
