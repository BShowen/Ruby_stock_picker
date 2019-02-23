def stock_picker array
    profit = nil
    stocks = []
    pairs = array.combination(2).to_a
    pairs.each do |item| 
        current_pair_profit = item[1] - item[0] 
        if profit == nil
            profit = current_pair_profit 
            stocks.clear
            stocks << array.find_index(item[0]) << array.find_index(item[1])
        elsif profit < current_pair_profit
            profit = current_pair_profit 
            stocks.clear
            stocks << array.find_index(item[0]) << array.find_index(item[1])
        end
    end
    if profit <= 0
        return "To minimize your loss you would buy at index #{stocks[0]}, sell at index #{stocks[1]} and take a loss of $#{profit}.00"
    elsif profit > 0
        return "You would buy at index #{stocks[0]}, sell at index #{stocks[1]} and take a profit of $#{profit}.00"
    end
end