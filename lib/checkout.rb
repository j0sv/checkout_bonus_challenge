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
    @total = 0
    (0..length-1).each do |x|
    @total += basket[x][:item][:price]
    end
    if @total > 60
      ten_percent_off
      puts "Your total is: $#{@discount_percent}."
    else
    puts "Your total is: $#{@total}."
    end
  end

  def two_lavender_hearts
    @total -= 1.5
  end

  def ten_percent_off
    @discount_percent = @total * 0.9
  end

end
