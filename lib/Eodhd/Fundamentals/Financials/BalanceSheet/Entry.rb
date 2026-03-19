# Eodhd/Fundamentals/Financials/BalanceSheet/Entry.rb
# Eodhd::Fundamentals::Financials::BalanceSheet::Entry

class Eodhd
  class Fundamentals
    class Financials
      class BalanceSheet
        class Entry
          attr_reader\
            :date,
            :filing_date,
            :currency_symbol,
            :total_assets,
            :intangible_assets,
            :earning_assets,
            :other_current_assets,
            :total_liabilities,
            :total_stockholder_equity,
            :deferred_long_term_liabilities,
            :other_current_liabilities,
            :common_stock,
            :capital_stock,
            :retained_earnings,
            :other_liabilities,
            :goodwill,
            :other_assets,
            :cash,
            :cash_and_equivalents,
            :total_current_liabilities,
            :current_deferred_revenue,
            :net_debt,
            :short_term_debt,
            :short_long_term_debt,
            :short_long_term_debt_total,
            :other_stockholder_equity,
            :property_plant_equipment,
            :total_current_assets,
            :long_term_investments,
            :net_tangible_assets,
            :short_term_investments,
            :net_receivables,
            :long_term_debt,
            :inventory,
            :accounts_payable,
            :total_permanent_equity,
            :noncontrolling_interest_in_consolidated_entity,
            :temporary_equity_redeemable_noncontrolling_interests,
            :accumulated_other_comprehensive_income,
            :additional_paid_in_capital,
            :common_stock_total_equity,
            :preferred_stock_total_equity,
            :retained_earnings_total_equity,
            :treasury_stock,
            :accumulated_amortization,
            :non_current_assets_other,
            :deferred_long_term_asset_charges,
            :non_current_assets_total,
            :capital_lease_obligations,
            :long_term_debt_total,
            :non_current_liabilities_other,
            :non_current_liabilities_total,
            :negative_goodwill,
            :warrants,
            :preferred_stock_redeemable,
            :capital_surplus,
            :liabilities_and_stockholders_equity,
            :cash_and_short_term_investments,
            :property_plant_and_equipment_gross,
            :property_plant_and_equipment_net,
            :accumulated_depreciation,
            :net_working_capital,
            :net_invested_capital,
            :common_stock_shares_outstanding

          private

          def initialize(data)
            @date = data['date']
            @filing_date = data['filing_date']
            @currency_symbol = data['currency_symbol']
            @total_assets = data['totalAssets']
            @intangible_assets = data['intangibleAssets']
            @earning_assets = data['earningAssets']
            @other_current_assets = data['otherCurrentAssets']
            @total_liabilities = data['totalLiab']
            @total_stockholder_equity = data['totalStockholderEquity']
            @deferred_long_term_liabilities = data['deferredLongTermLiab']
            @other_current_liabilities = data['otherCurrentLiab']
            @common_stock = data['commonStock']
            @capital_stock = data['capitalStock']
            @retained_earnings = data['retainedEarnings']
            @other_liabilities = data['otherLiab']
            @goodwill = data['goodWill']
            @other_assets = data['otherAssets']
            @cash = data['cash']
            @cash_and_equivalents = data['cashAndEquivalents']
            @total_current_liabilities = data['totalCurrentLiabilities']
            @current_deferred_revenue = data['currentDeferredRevenue']
            @net_debt = data['netDebt']
            @short_term_debt = data['shortTermDebt']
            @short_long_term_debt = data['shortLongTermDebt']
            @short_long_term_debt_total = data['shortLongTermDebtTotal']
            @other_stockholder_equity = data['otherStockholderEquity']
            @property_plant_equipment = data['propertyPlantEquipment']
            @total_current_assets = data['totalCurrentAssets']
            @long_term_investments = data['longTermInvestments']
            @net_tangible_assets = data['netTangibleAssets']
            @short_term_investments = data['shortTermInvestments']
            @net_receivables = data['netReceivables']
            @long_term_debt = data['longTermDebt']
            @inventory = data['inventory']
            @accounts_payable = data['accountsPayable']
            @total_permanent_equity = data['totalPermanentEquity']
            @noncontrolling_interest_in_consolidated_entity = data['noncontrollingInterestInConsolidatedEntity']
            @temporary_equity_redeemable_noncontrolling_interests = data['temporaryEquityRedeemableNoncontrollingInterests']
            @accumulated_other_comprehensive_income = data['accumulatedOtherComprehensiveIncome']
            @additional_paid_in_capital = data['additionalPaidInCapital']
            @common_stock_total_equity = data['commonStockTotalEquity']
            @preferred_stock_total_equity = data['preferredStockTotalEquity']
            @retained_earnings_total_equity = data['retainedEarningsTotalEquity']
            @treasury_stock = data['treasuryStock']
            @accumulated_amortization = data['accumulatedAmortization']
            @non_current_assets_other = data['nonCurrrentAssetsOther']
            @deferred_long_term_asset_charges = data['deferredLongTermAssetCharges']
            @non_current_assets_total = data['nonCurrentAssetsTotal']
            @capital_lease_obligations = data['capitalLeaseObligations']
            @long_term_debt_total = data['longTermDebtTotal']
            @non_current_liabilities_other = data['nonCurrentLiabilitiesOther']
            @non_current_liabilities_total = data['nonCurrentLiabilitiesTotal']
            @negative_goodwill = data['negativeGoodwill']
            @warrants = data['warrants']
            @preferred_stock_redeemable = data['preferredStockRedeemable']
            @capital_surplus = data['capitalSurpluse']
            @liabilities_and_stockholders_equity = data['liabilitiesAndStockholdersEquity']
            @cash_and_short_term_investments = data['cashAndShortTermInvestments']
            @property_plant_and_equipment_gross = data['propertyPlantAndEquipmentGross']
            @property_plant_and_equipment_net = data['propertyPlantAndEquipmentNet']
            @accumulated_depreciation = data['accumulatedDepreciation']
            @net_working_capital = data['netWorkingCapital']
            @net_invested_capital = data['netInvestedCapital']
            @common_stock_shares_outstanding = data['commonStockSharesOutstanding']
          end
        end
      end
    end
  end
end
