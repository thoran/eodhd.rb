# Eodhd/Fundamentals/ESGScores.rb
# Eodhd::Fundamentals::ESGScores

class Eodhd
  class Fundamentals
    class ESGScores
      attr_reader\
        :rating_date,
        :total_esg,
        :total_esg_percentile,
        :environment_score,
        :environment_score_percentile,
        :social_score,
        :social_score_percentile,
        :governance_score,
        :governance_score_percentile,
        :controversy_level,
        :activities_involvement

      private

      def initialize(data)
        @rating_date = data['RatingDate']
        @total_esg = data['TotalEsg']
        @total_esg_percentile = data['TotalEsgPercentile']
        @environment_score = data['EnvironmentScore']
        @environment_score_percentile = data['EnvironmentScorePercentile']
        @social_score = data['SocialScore']
        @social_score_percentile = data['SocialScorePercentile']
        @governance_score = data['GovernanceScore']
        @governance_score_percentile = data['GovernanceScorePercentile']
        @controversy_level = data['ControversyLevel']
        @activities_involvement = data['ActivitiesInvolvement']
      end
    end
  end
end
