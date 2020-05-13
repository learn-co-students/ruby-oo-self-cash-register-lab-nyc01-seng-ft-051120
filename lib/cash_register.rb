class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction_amount

    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
    end 

    def add_item(title, price, quantity = 1) 
        
        self.total += price * quantity
        if quantity > 1
            count = 0
            while count < quantity 
                @items.push(title)
                count += 1
            end
        else 
            @items.push(title)
        end 
        self.last_transaction_amount = price * quantity 
    end 

    def apply_discount
        if @discount > 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i 
            return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end 
    end 

    def void_last_transaction
        self.total = self.total - self.last_transaction_amount 
    end 

end 

