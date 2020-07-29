class Market
 attr_reader  :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []

  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.check_stock(item) != 0
    end
  end

  def total_inventory
    inventory_hash = Hash.new { |h,k| h[k] = {quantity: 0, vendors: []}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        inventory_hash[item][:quantity] += amount
        inventory_hash[item][:vendors] << vendor
      end
    end
    inventory_hash
    # require "pry"; binding.pry
  end

end

# Add a method to your `Market` class called `sorted_item_list` that returns a list of names of all items the Vendors have in stock, sorted alphabetically. This list should not include any duplicate items.
#
# Additionally, your `Market` class should have a method called `total_inventory` that reports the quantities of all items sold at the market. Specifically, it should return a hash with items as keys and hash as values - this sub-hash should have two key/value pairs: quantity pointing to total inventory for that item and vendors pointing to an array of the vendors that sell that item.
#
# You `Market` will also be able to identify `overstocked_items`.  An item is overstocked if it is sold by more than 1 vendor AND the total quantity is greater than 50.
#
# Use TDD to update your `Market` class so that it responds to the following interaction pattern:
