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
  return holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each { |_, supplies| supplies << supply }
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

#
def add_new_holiday_with_supplies(holiday_hash, season_name, holiday_name, supply_array)
  season_hash = holiday_hash[season_name]
  season_hash[holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_hash = holiday_hash[:winter]
  winter_hash.values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |name, season_hash|
    snake_case_to_string(name)
    puts name + ":"
    season_hash.each do |holiday_sym, holiday_arr|
      puts "  #{holiday_sym.to_s.capitalize}: #{holiday_arr.join ", "}"
    end
  end
end

def snake_case_to_string(name)
  name_arr = name.split("_")
  caps = name_arr.map { |x| x.capitalize}
  caps.join(" ")
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

end
