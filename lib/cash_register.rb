class CashRegister
    attr_accessor :total, :discount, :items 

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity


            quantity.times do
                @items << title
            end
       

        @last_transaction = price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = @total - @total * @discount / 100
            "After the discount, the total comes to $#{@total}."
        elsif @discount == 0
            "There is no discount to apply."
        end
    end



    def void_last_transaction
        @total -= @last_transaction
    end
end




  