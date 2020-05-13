require 'pry'

class CashRegister
    attr_writer :title, :price, :quantity
    attr_accessor :discount, :previous_total, :total
    attr_reader :array_items
  

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @previous_total = 0
        @array_items = []
    end


    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity
        self.previous_total = self.total
        self.total += @price * @quantity
        q = 1 
        while q <= @quantity
            self.array_items << @title
            q += 1
        end
    end

    def items
        self.array_items
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            self.total =  self.total.to_f * (1 - (self.discount / 100.to_f))
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total = self.previous_total
    end


end

