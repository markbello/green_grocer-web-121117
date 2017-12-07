require "pry"

def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each{|item|
    item.each{|key, value|
      consolidated_cart[key] = value
      !consolidated_cart[key][:count] ? consolidated_cart[key][:count] = 1 : consolidated_cart[key][:count] +=1
    }
  }
  consolidated_cart
end

def apply_coupons(cart, coupons)
  coupons_to_apply = cart.each {|cart_item, attributes|
    applied_coupon = coupons.map{
      |coupon_item|
      # binding.pry
      if coupon_item[:item] == cart_item && (attributes[:count] % coupon_item[:num] == 0)
        attributes[:count] -= coupon_item[:num]
        # binding.pry
        coupon_title = "#{cart_item} W/COUPON"
        coupon_hash = attributes
        # binding.pry
        coupon_hash[:count] = 1
        coupon_hash[:price] = coupon_item[:cost]
        # binding.pry
        coupon_return_hash = {}
        coupon_return_hash[coupon_title] = coupon_hash
        coupon_return_hash
      end
    }
    applied_coupon
    binding.pry
  }
  coupons_to_apply.flatten!
  cart.merge(coupons_to_apply[0])
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
