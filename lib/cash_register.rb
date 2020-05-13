require 'pry'
class CashRegister
    attr_accessor :last_transaction, :discount, :total, :price, :quantity, :items, :item, :full_price
    #@@total = 0   #??
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end
    def add_item(title, price, quantity = 1)  #self?
        # full_price = price * quantity
        # @total += full_price
        if quantity > 1
            i = 0
            while i < quantity
        @items << title
        i+= 1
            end
            else
                @items << title
            end
            @last_transaction = price*quantity
            @total += price*quantity
            @total
    end
    def apply_discount  #self?
        if discount > 0
            dis = @total * discount / 100
            @total-= dis
            "After the discount, the total comes to $#{@total}."
        elsif discount == 0
            "There is no discount to apply."
        end
    end
    def items
        @items
    end
    def void_last_transaction
        @total -= @last_transaction
    end
end
