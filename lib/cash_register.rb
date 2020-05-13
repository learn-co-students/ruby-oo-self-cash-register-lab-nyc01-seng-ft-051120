class CashRegister
    attr_reader :discount
    attr_accessor :total
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(name,price,quantity=1)
        @items <<{name:name,price:price,quantity:quantity}
        self.total = self.total + (price * quantity)
    end

    def apply_discount
        total_discount = (self.total * self.discount/100)
        self.total = self.total - total_discount
       discount > 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply."
    end

    def items 
        items_at_register =[]
        @items.each do |item| 
            item[:quantity].times{items_at_register<<item[:name]}
        end
        items_at_register
    end

    def void_last_transaction
        item_to_remove = @items.pop
        self.total = self.total - (item_to_remove[:price] * item_to_remove[:quantity])
    end
end