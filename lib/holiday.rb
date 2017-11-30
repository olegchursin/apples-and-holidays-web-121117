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
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = {
    holiday_name => supply_array
    }
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    puts "#{season.capitalize}:" #prints sesons capitalized
    holiday.each do |name, supplies|
      puts "  #{name.to_s.split("_").collect {|lexeme| lexeme.capitalize }.join(" ")}: #{supplies.join(", ")}"
      #iterate on holiday(values) of the holiday_hash and return name converted to string with .to_s method
      #apply .split("_") to remove "_" in the holiday names
      #apply .map method to collect all lexemes into new array and run the block with &:capitalize shortcut and .join(" ") method to transform array back to string
      #concatenate supplies with .join(", ") method
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq = holiday_hash.map do |season, holiday| #create array bbq taking result of .map iteration over holiday_hash
    holiday.map do |name, supplies| #iterate over holidays in holiday_hash
      name if supplies.include?("BBQ") #return holiday name if the supply value includes BBQ
    end
  end
  bbq.flatten.compact #return bbq array with .flatten method and .compact method to get rid of .nil values
end
