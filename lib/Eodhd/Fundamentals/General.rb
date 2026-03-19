# Eodhd/Fundamentals/General.rb
# Eodhd::Fundamentals::General

class Eodhd
  class Fundamentals
    class General
      attr_reader\
        :code,
        :type,
        :name,
        :exchange,
        :currency_code,
        :currency_name,
        :currency_symbol,
        :country_name,
        :country_iso,
        :isin,
        :lei,
        :cusip,
        :cik,
        :employer_id_number,
        :fiscal_year_end,
        :ipo_date,
        :international_domestic,
        :sector,
        :industry,
        :gic_sector,
        :gic_group,
        :gic_industry,
        :gic_sub_industry,
        :home_category,
        :is_delisted,
        :description,
        :address,
        :address_data,
        :listings,
        :officers,
        :phone,
        :web_url,
        :logo_url,
        :full_time_employees,
        :updated_at

      private

      def initialize(data)
        @code = data['Code']
        @type = data['Type']
        @name = data['Name']
        @exchange = data['Exchange']
        @currency_code = data['CurrencyCode']
        @currency_name = data['CurrencyName']
        @currency_symbol = data['CurrencySymbol']
        @country_name = data['CountryName']
        @country_iso = data['CountryISO']
        @isin = data['ISIN']
        @lei = data['LEI']
        @cusip = data['CUSIP']
        @cik = data['CIK']
        @employer_id_number = data['EmployerIdNumber']
        @fiscal_year_end = data['FiscalYearEnd']
        @ipo_date = data['IPODate']
        @international_domestic = data['InternationalDomestic']
        @sector = data['Sector']
        @industry = data['Industry']
        @gic_sector = data['GicSector']
        @gic_group = data['GicGroup']
        @gic_industry = data['GicIndustry']
        @gic_sub_industry = data['GicSubIndustry']
        @home_category = data['HomeCategory']
        @is_delisted = data['IsDelisted']
        @description = data['Description']
        @address = data['Address']
        @address_data = data['AddressData']
        @listings = data['Listings']
        @officers = data['Officers']
        @phone = data['Phone']
        @web_url = data['WebURL']
        @logo_url = data['LogoURL']
        @full_time_employees = data['FullTimeEmployees']
        @updated_at = data['UpdatedAt']
      end
    end
  end
end
