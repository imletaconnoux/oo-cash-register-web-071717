class CashRegister

    attr_accessor :total, :discount, :cart, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(title, price, quantity = 1)
    item_info = {}
    item_info[:name] = title
    item_info[:price] = price
    item_info[:quantity] = quantity
    @total += price * quantity
    @cart << item_info
    @last_transaction = price * quantity
  end

  def apply_discount
    if @discount != 0
      self.total = @total - ((@total * @discount)/100)
      return "After the discount, the total comes to $#{total}."
    else
    return "There is no discount to apply."
   end
  end

  def items
    all_items = []

    self.cart.each do |item_info|
      item_info[:quantity].times do
        all_items << item_info[:name]
      end
    end
    all_items
  end

  def void_last_transaction
    @total = self.total - @last_transaction
  end

 end
