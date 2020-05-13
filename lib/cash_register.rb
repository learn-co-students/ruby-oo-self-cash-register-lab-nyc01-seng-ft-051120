require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :cart, :last_transaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(title, price, quantity = 1)
        # @items = []
            quantity.times do
                @items.push(title)
            end
        self.total += price * quantity
        @last_transaction = price * quantity
    end
    def apply_discount
        if @discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            return "After the discount, the total comes to $#{self.total}."
        else @discount = 0
            return "There is no discount to apply."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        self.total -= @last_transaction
    end
end