# > stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4]  # for a profit of $15 - $3 == $12
def stock_picker(stock_prices = Array.new) #stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
# range for the buy dates, end dates
buy = [0]
sell = [0]
best_margin = [0]
  stock_prices[0..-2].each_with_index do |buy_price, buy_date|
    stock_prices[buy_date..-1].each_with_index do |sell_price, sell_date|
      margin = sell_price - buy_price
      # calculate all margins and choose the biggest one
      if margin > best_margin[0]
        best_margin[0] = margin #this will change/increase best_margin until it reaches the highest point
        buy[0] = buy_date
        sell[0] = buy_date + sell_date
      end
    end
  end
  p "You should buy on the #{buy}, sell on the #{sell} for a maximum profit of $#{best_margin}!"
end

stock_picker([17,3,6,9,15,8,6,1,10])  #1,4
stock_picker([1,2,5,7,17,4,14,8])  #0,4
