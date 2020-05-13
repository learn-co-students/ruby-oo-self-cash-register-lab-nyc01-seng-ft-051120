require 'pry'

class CashRegister
    attr_reader :discount
    attr_accessor :total, :cart
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @cart = [];
    end

    def calc_total 
      self.cart.empty? ?
        self.total = 0 :
        self.total = self.cart.reduce(0) { |memo, item| memo += item[:price] * item[:quantity] }
    end

    def add_item(name, price, quantity = 1)
       self.cart << {
          name: name,
          price: price,
          quantity: quantity
        }
      self.calc_total
    end

    def items
      self.cart.collect{ |item| 
        new_value = []
        item[:quantity].times { new_value << item[:name] }
        new_value
    }.flatten
    end

    def void_last_transaction
      self.cart.pop
      self.calc_total
    end

    def apply_discount
      self.total = self.total - (self.total * (self.discount * 0.01))
      # convert to integer if float is a whole number
      (self.total % 1).zero? ? self.total = self.total.to_i : nil
      discount > 0 ?
        "After the discount, the total comes to $#{self.total}." :
        "There is no discount to apply."
    end
end