def get_first_name_of_season_winner(data, season)
  # code here
  winner_name = "default"
  winner_info_hash = {}

  data.each do |season_num, info|
    if season_num == season
      info.each do |details_hash|
        details_hash.each do |category, details|
          if category == "status" && details == "Winner"
            winner_info_hash = details_hash
          end
        end
      end
    end
  end
  # puts winner_name
  winner_info_hash["name"].split.first
end


def get_contestant_name(data, occupation)
  # code here
  data.each do |season, array|
    array.each do |contestant_info|
      if contestant_info.has_value?(occupation)
        contestant_info.each do |detail_cat, detail|
          if detail_cat == "name"
            return detail
          end
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  # code here
  counter = 0
  data.each do |season, array|
    array.each do |contestant_info|
      if contestant_info.has_value?(hometown)
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  # code here
  data.each do |season, array|
    array.each do |contestant_info|
      if contestant_info.has_value?(hometown)
        contestant_info.each do |category, details|
          if category == "occupation"
            return details
          end
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  age_total = 0
  number_of_contestants = 0

  data.each do |season_num, array|
    if season_num == season
      array.each do |contestant_info|
        contestant_info.each do |category, details|
          if category == "age"
            age_total += details.to_i
            number_of_contestants += 1.0
          end
        end
      end
    end
  end
  (age_total/number_of_contestants).round
end
