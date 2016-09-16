
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name,details|
  case details["age"]
  when (0..17)
    details["age_group"] = "kids"
  when (18..64)
    details["age_group"] = "adults"
  else 
    details["age_group"] = "seniors"
  end 
end 

puts munsters


      