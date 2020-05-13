require 'pry'

class CashRegister
   attr_accessor :total, :item, :price 

    def initialize(discount = 0)
    @total = 0
    @discount = discount 
    @items = []
   end


    def add_item(item, price, quantity = 1) 
        if quantity != 1
        @total += price * quantity
      else
         @total += price
      end

    end 

    def apply_discount
       if @discount != 0
         @total = @total - @total * @discount/100
        return "After the discount, the total comes to $#{@total}."
       else 
        return "There is no discount to apply."
       end 
    end



    def void_last_transaction
        @total -= @price 
    end 

end 
