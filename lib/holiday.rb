require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do|season, event|
      event.each do |event, data|
        if season == :winter
      data << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do|season, event|
      event.each do |event, data|
          if season == :spring
        data << supply
        end
      end
    end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end


  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday_names|
    puts "#{season.capitalize}:"
    holiday_names.each do |holiday_name, item|
      puts "  #{holiday_name.to_s.split("_").map{|word| word.capitalize}.join(" ")}: #{item.join(", ")}"
    end
  end
end

  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

def all_holidays_with_bbq(holiday_hash)
    holidays_with_bbq = []
    holiday_hash.collect do |season, holiday_names|
      holiday_names.collect do |holiday_name, items|
        if items.include?("BBQ")
          holidays_with_bbq << holiday_name
        end
      end
    end
    holidays_with_bbq
end
