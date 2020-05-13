require 'pry'
class CashRegister
attr_accessor :total, :discount, :quantity
  def initialize(discount=0)
        @total=0
        @discount=discount
        @quantity=0
        @title=[]

    end
def add_item(title, price, quantity=1)
    @total +=price*quantity
    @last_price=price*quantity
   quantity.times do @title.push(title) end
   
    
end
    def apply_discount
    @total=@total-@total/100*@discount
    if discount==0
    "There is no discount to apply."
    else 
        "After the discount, the total comes to $#{@total}."
    end
end
    def items
        @title
    end
    def void_last_transaction
        @total -= @last_price
        @title.pop()
        #binding.pry
    end
end
