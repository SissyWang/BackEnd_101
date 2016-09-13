#1 
method 1: age.key?('Spot') => false 
method 2: age.include?('Spot') => false 
method 3: age.member?('Spot') => false 

#2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.inject(:+)

#3
method 1: ages.select{|x,y| y<100}
method 2: ages.keep_if{|_,ages| ages<100}

#4
1) munsters_description.capitalize
2) munsters_description.swapcase
3) munsters_description.downcase
4) munsters_description.upcase

#5
ages.merge!(additional_ages)

#6
ages.values.min

#7
method 1: advice.include?("Dino")  => false 
method 2: advice.match("Dino")  => nil

#8
flinstones.index {|name| name[0,2] == "Be"}

#9
flinstones.map! do |name|
  name[0,3]
end 

#10
flinstones.map! {|name| name[0,3]}