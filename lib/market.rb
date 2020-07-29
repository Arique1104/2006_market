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

end

# A Vendor will be able to calculate their `potential_revenue` - the sum of all their items' price * quantity.
#
# A Market is responsible for keeping track of Vendors. It should have a method called `vendor_names` that returns an array of all the Vendor's names.
#
# Additionally, the Market should have a method called `vendors_that_sell` that takes an argument of an item represented as a String. It will return a list of Vendors that have that item in stock.
#
# Use TDD to create a `Market` class that responds to the following interaction pattern:
