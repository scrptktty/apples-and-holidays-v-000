require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  return holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each { |_, supplies| supplies << supply }
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season_name, holiday_name, supply_array)
  season_hash = holiday_hash[season_name]
  season_hash[holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  winter_hash = holiday_hash[:winter]
  winter_hash.values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |name, season_hash|
    puts name.to_s.capitalize + ":"
    season_hash.each do |holiday_sym, holiday_arr|
      puts "  #{snake_case_to_capitalized_string(holiday_sym)}: #{holiday_arr.join ", "}"
    end
  end
end

def snake_case_to_capitalized_string(name)
  string_name = name.to_s
  name_arr = string_name.split("_")
  caps = name_arr.map { |w| w.capitalize }
  caps.join(" ")
end

def all_holidays_with_bbq(holiday_hash)
  bbq_syms = []
    holiday_hash.each do |name, season_hash|
    season_hash.each do |holiday_sym, holiday_arr|
      if holiday_arr.include?("BBQ")
        bbq_syms << holiday_sym
      end
    end
  end
  bbq_syms
end
