require 'pry'

class CashRegister
   attr_accessor :total, :previous_total, :previous_items
   attr_reader :discount, :items

   def initialize(discount = nil)
      @total = 0
      @discount = discount
      @items = []
   end

   def add_item(title, price, quantity = 1)
      @previous_total = @total
      @total += price * quantity
      @previous_items = @items
      quantity.times{@items << title}
   end

   def apply_discount
      if @discount
         @total -= @total * @discount/100
         "After the discount, the total comes to $#{@total}."
      else
         "There is no discount to apply."
      end
   end

   def void_last_transaction
      @total = @previous_total
   end
end

