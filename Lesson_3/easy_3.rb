#1 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#2
flintstones<<'Dino'

#3
method 1: flintstones += [Dino,Poppy]
method 2: flintstones.push('Dino').push('Poppy')
method 3: flintstones.concat(%w(Dino Poppy))

#4
advice.slice!('house training your pet dinosaur.')
advice.slice!(0,advicce.index('house'))
bonus: when puts advice, since the slice can not mutate the original variable, so the printed content would not change. 

#5
method 1: statement.count't'
method 2: statement.scan('t').count

#6
title.center(40)

