require 'pry'
class CashRegister
attr_accessor :discount, :total, :title, :price, :items
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @price = price
        @quantity = quantity
        quantity.times {@items << title}
    end
    
    def apply_discount
        if @discount == 0
            p "There is no discount to apply."
        else
        @total = @total-((@discount * 0.01) * @total)
        @total = @total.to_i
        p "After the discount, the total comes to $#@total."
        end
    end

    def void_last_transaction
        @total -= @price * @quantity
    end
end



