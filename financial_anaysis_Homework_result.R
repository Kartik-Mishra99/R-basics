#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#find profit
profit <- revenue-expenses
profit
#profit after 30% tax for each month
profit_after_tax <- round(profit - profit*(30/100),2)
profit_after_tax

# profit margin for each month = profit after tax divided by revenue
profit_margin = round(profit_after_tax/revenue,2)*100
profit_margin

#good months - where profit after tax was greater than mean for the year
mean_profit_after_tax = mean(profit_after_tax)
mean_profit_after_tax
good_months = profit_after_tax > mean_profit_after_tax
good_months
# bad months - where profit after tax was less than mean for the year
bad_months = !good_months # ! means the opposite
bad_months

#bestmonth- where profit after tax was max for the year
best_month = profit_after_tax == max(profit_after_tax)
best_month
#worstmonth- where profit after tax was min for the yea
worst_month = profit_after_tax == min(profit_after_tax)
worst_month

#units of thousands 

revenue_1000 <- round(revenue/1000)
revenue_1000

expenses_1000 <- round(expenses/1000)
expenses_1000

profit_1000 <- round(profit/1000)
profit_1000

profit_after_tax_1000 <- round(profit_after_tax/1000)
profit_after_tax_1000

# final output
revenue_1000
expenses_1000
profit_1000
profit_after_tax_1000
profit_margin
good_months
bad_months
best_month
worst_month

# matrices 
result_matrix <- rbind(revenue_1000,        #rbind is the row bind
                 expenses_1000,
                 profit_1000,
                 profit_after_tax_1000,
                 profit_margin,
                 good_months,
                 bad_months,
                 best_month,
                 worst_month)
result_matrix









