require 'yaml'

class Checkout

  attr_accessor :basket, :products, :total

  def initialize
    @basket = []
    @products = YAML.load_file('./lib/product_list.yml')
  end

  def shop(index)
    @basket << @products[index]
    puts "You have added #{@products[index][:item][:name]} (price: $#{@products[index][:item][:price]})."
  end

  def total_cost
    count_hearts
    count_total_price
    if enough_hearts?
    end
    if @total >= 60
      ten_percent_off
    end
    puts "Your total is: $#{@total.round(2)}."
  end

  def two_lavender_hearts
    @discount_two = @total - 1.5
  end

  def ten_percent_off
    @total = @total * 0.9
  end

  def count_total_price
    length = basket.length
    @total = 0
    (0..length-1).each do |x|
    @total += basket[x][:item][:price]
    end
  end

  def count_hearts
    length = basket.length
    @hearts = 0
    (0..length-1).each do |x|
      if basket[x][:item][:code] == 0
        @hearts += 1
      end
    end
  end

  def enough_hearts?
    if @hearts >= 2
    @total -= 1.5
    end
  end
end
