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
  end

  def overstocked_items
    over_stocked = []
    result = total_inventory.find_all do |item, inventory_hash|
      if inventory_hash[:quantity] > 50 && inventory_hash[:vendors].count > 1
        item
      end
    end
    result.each do |key,inventory|
      over_stocked << key
    end
    over_stocked
  end

  def sorted_item_list
    items_list = []
    total_inventory.keys.each do |item|
      items_list << item.name
    end
    items_list.sort
  end

end

# Add a method to your `Market` class called `sorted_item_list` that returns a list of names of all items the Vendors have in stock, sorted alphabetically. This list should not include any duplicate items.
#

#
#
# Use TDD to update your `Market` class so that it responds to the following interaction pattern:
