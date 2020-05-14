require "pry"

class CashRegister
    attr_accessor :discount, :total, :last_transaction, :apply_discount, :items, :void_last_transaction
    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
    end 
    
    def add_item(title, price, amount=1)
    self.total += price * amount
    amount.times do 
        @items << title
    end
    self.last_transaction = price * amount
    end 

    def apply_discount
        if discount != 0
        self.total = (total - total * (@discount.to_f / 100)).to_i
        "After the discount, the total comes to $#{self.total}."
        else
        "There is no discount to apply."
        end
        #   binding.pry
    end 


    def void_last_transaction
        self.total = self.total - self.last_transaction
      end 

end 
