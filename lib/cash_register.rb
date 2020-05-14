require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end
    
    def add_item(item_name, price, quantity=1)
        self.total += quantity * price
        quantity.times do
            @items.push(item_name)
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            self.total = (total * ((100.0 - discount.to_f)/100.0)).to_i
            "After the discount, the total comes to $#{self.total}."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end

## got some help via google to work through the last half (apply discount)