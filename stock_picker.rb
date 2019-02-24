def stock_picker stock_prices
    profit = nil
    best_stocks = []
    pairs = stock_prices.combination(2).to_a
    pairs.each do |item| 
        current_pair_profit = item[1] - item[0] 
        if profit == nil
            profit = current_pair_profit 
            best_stocks.clear
            best_stocks << stock_prices.find_index(item[0]) << stock_prices.find_index(item[1])
        elsif profit < current_pair_profit
            profit = current_pair_profit 
            best_stocks.clear
            best_stocks << stock_prices.find_index(item[0]) << stock_prices.find_index(item[1])
        end
    end
    if profit <= 0
        return "To minimize your loss you would buy at index #{best_stocks[0]}, sell at index #{best_stocks[1]} and take a loss of $#{profit}.00"
    elsif profit > 0
        return "You would buy at index #{best_stocks[0]}, sell at index #{best_stocks[1]} and take a profit of $#{profit}.00"
    end
end
