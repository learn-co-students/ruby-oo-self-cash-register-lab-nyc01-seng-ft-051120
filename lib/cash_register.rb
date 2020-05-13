require 'pry'
class CashRegister
    attr_reader :items, :discount
    attr_writer
    attr_accessor :total

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

     def add_item(title,price,quantity=1)
        self.total += price * quantity
        quantity.times do
        items.push(title)
     end

    def apply_discount
        if @discount > 0 
            @total = @total - (@discount.to_f / 100.0) * @total
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
        return "There is no discount to apply."
        end
    end
    def last_transaction=(total)
        @last_transaction = total
    end

    def void_last_transaction
        self.total -= @last_transaction.to_f
     end
end
end

# cash_register = CashRegister.new
# cash_register.add_item("tomato",3)
# cash_register.total
# cash_register.add_item("peas",1)