class CashRegister
    def initialize(discount)
        @total = 0
        @discount = @total - (@total * 0.20)
    end 

    attr_accessor :total

    def discount
    end 

    def add_item(title, price)
        total += price

    end 
end 
