# Eodhd/Fundamentals/Financials/IncomeStatement/Entry.rb
# Eodhd::Fundamentals::Financials::IncomeStatement::Entry

class Eodhd
  class Fundamentals
    class Financials
      class IncomeStatement
        class Entry
          attr_reader\
            :date,
            :filing_date,
            :currency_symbol,
            :research_development,
            :effect_of_accounting_charges,
            :income_before_tax,
            :minority_interest,
            :net_income,
            :selling_general_administrative,
            :selling_and_marketing_expenses,
            :gross_profit,
            :reconciled_depreciation,
            :ebit,
            :ebitda,
            :depreciation_and_amortization,
            :non_operating_income_net_other,
            :operating_income,
            :other_operating_expenses,
            :interest_expense,
            :tax_provision,
            :interest_income,
            :net_interest_income,
            :extraordinary_items,
            :non_recurring,
            :other_items,
            :income_tax_expense,
            :total_revenue,
            :total_operating_expenses,
            :cost_of_revenue,
            :total_other_income_expense_net,
            :discontinued_operations,
            :net_income_from_continuing_operations,
            :net_income_applicable_to_common_shares,
            :preferred_stock_and_other_adjustments

          private

          def initialize(data)
            @date = data['date']
            @filing_date = data['filing_date']
            @currency_symbol = data['currency_symbol']
            @research_development = data['researchDevelopment']
            @effect_of_accounting_charges = data['effectOfAccountingCharges']
            @income_before_tax = data['incomeBeforeTax']
            @minority_interest = data['minorityInterest']
            @net_income = data['netIncome']
            @selling_general_administrative = data['sellingGeneralAdministrative']
            @selling_and_marketing_expenses = data['sellingAndMarketingExpenses']
            @gross_profit = data['grossProfit']
            @reconciled_depreciation = data['reconciledDepreciation']
            @ebit = data['ebit']
            @ebitda = data['ebitda']
            @depreciation_and_amortization = data['depreciationAndAmortization']
            @non_operating_income_net_other = data['nonOperatingIncomeNetOther']
            @operating_income = data['operatingIncome']
            @other_operating_expenses = data['otherOperatingExpenses']
            @interest_expense = data['interestExpense']
            @tax_provision = data['taxProvision']
            @interest_income = data['interestIncome']
            @net_interest_income = data['netInterestIncome']
            @extraordinary_items = data['extraordinaryItems']
            @non_recurring = data['nonRecurring']
            @other_items = data['otherItems']
            @income_tax_expense = data['incomeTaxExpense']
            @total_revenue = data['totalRevenue']
            @total_operating_expenses = data['totalOperatingExpenses']
            @cost_of_revenue = data['costOfRevenue']
            @total_other_income_expense_net = data['totalOtherIncomeExpenseNet']
            @discontinued_operations = data['discontinuedOperations']
            @net_income_from_continuing_operations = data['netIncomeFromContinuingOps']
            @net_income_applicable_to_common_shares = data['netIncomeApplicableToCommonShares']
            @preferred_stock_and_other_adjustments = data['preferredStockAndOtherAdjustments']
          end
        end
      end
    end
  end
end
