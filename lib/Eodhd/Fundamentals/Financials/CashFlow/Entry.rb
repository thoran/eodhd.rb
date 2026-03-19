# Eodhd/Fundamentals/Financials/CashFlow/Entry.rb
# Eodhd::Fundamentals::Financials::CashFlow::Entry

class Eodhd
  class Fundamentals
    class Financials
      class CashFlow
        class Entry
          attr_reader\
            :date,
            :filing_date,
            :currency_symbol,
            :investments,
            :change_to_liabilities,
            :total_cashflows_from_investing_activities,
            :net_borrowings,
            :total_cash_from_financing_activities,
            :change_to_operating_activities,
            :net_income,
            :change_in_cash,
            :begin_period_cash_flow,
            :end_period_cash_flow,
            :total_cash_from_operating_activities,
            :issuance_of_capital_stock,
            :depreciation,
            :other_cashflows_from_investing_activities,
            :dividends_paid,
            :change_to_inventory,
            :change_to_account_receivables,
            :sale_purchase_of_stock,
            :other_cashflows_from_financing_activities,
            :change_to_netincome,
            :capital_expenditures,
            :change_receivables,
            :cash_flows_other_operating,
            :exchange_rate_changes,
            :cash_and_cash_equivalents_changes,
            :change_in_working_capital,
            :stock_based_compensation,
            :other_non_cash_items,
            :free_cash_flow

          private

          def initialize(data)
            @date = data['date']
            @filing_date = data['filing_date']
            @currency_symbol = data['currency_symbol']
            @investments = data['investments']
            @change_to_liabilities = data['changeToLiabilities']
            @total_cashflows_from_investing_activities = data['totalCashflowsFromInvestingActivities']
            @net_borrowings = data['netBorrowings']
            @total_cash_from_financing_activities = data['totalCashFromFinancingActivities']
            @change_to_operating_activities = data['changeToOperatingActivities']
            @net_income = data['netIncome']
            @change_in_cash = data['changeInCash']
            @begin_period_cash_flow = data['beginPeriodCashFlow']
            @end_period_cash_flow = data['endPeriodCashFlow']
            @total_cash_from_operating_activities = data['totalCashFromOperatingActivities']
            @issuance_of_capital_stock = data['issuanceOfCapitalStock']
            @depreciation = data['depreciation']
            @other_cashflows_from_investing_activities = data['otherCashflowsFromInvestingActivities']
            @dividends_paid = data['dividendsPaid']
            @change_to_inventory = data['changeToInventory']
            @change_to_account_receivables = data['changeToAccountReceivables']
            @sale_purchase_of_stock = data['salePurchaseOfStock']
            @other_cashflows_from_financing_activities = data['otherCashflowsFromFinancingActivities']
            @change_to_netincome = data['changeToNetincome']
            @capital_expenditures = data['capitalExpenditures']
            @change_receivables = data['changeReceivables']
            @cash_flows_other_operating = data['cashFlowsOtherOperating']
            @exchange_rate_changes = data['exchangeRateChanges']
            @cash_and_cash_equivalents_changes = data['cashAndCashEquivalentsChanges']
            @change_in_working_capital = data['changeInWorkingCapital']
            @stock_based_compensation = data['stockBasedCompensation']
            @other_non_cash_items = data['otherNonCashItems']
            @free_cash_flow = data['freeCashFlow']
          end
        end
      end
    end
  end
end
