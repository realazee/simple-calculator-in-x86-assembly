and.o: and.S
	as -g and.S -o and.o

or.o: or.S
	as -g or.S -o or.o

sum.o: sum.S
	as -g sum.S -o sum.o
calc.o: calc.S
	as -g calc.S -o calc.o
    
upper.o: upper.S
	as -g upper.S -o upper.o
    
upperonly_cmds.o: data/upperonly_cmds.S
	as -g data/upperonly_cmds.S -o upperonly_cmds.o
    
simpleone_cmds.o: data/simpleone_cmds.S
	as -g data/simpleone_cmds.S -o simpleone_cmds.o
    
basic_cmds.o: data/basic_cmds.S
	as -g data/basic_cmds.S -o basic_cmds.o
    
easy_cmds.o: data/easy_cmds.S
	as -g data/easy_cmds.S -o easy_cmds.o


basicwithupper_cmds.o: data/basicwithupper_cmds.S
	        as -g data/basicwithupper_cmds.S -o basicwithupper_cmds.o
		
arraysum.o: arraysum.S
	as -g arraysum.S -o arraysum.o

arraysum_cmds.o: data/arraysum_cmds.S
	as -g data/arraysum_cmds.S -o arraysum_cmds.o
    
simplerandom_cmds.o: data/simplerandom_cmds.S
	as -g data/simplerandom_cmds.S -o simplerandom_cmds.o

calc_basic: calc.o upper.o or.o and.o sum.o arraysum.o basic_cmds.o
	ld -g calc.o upper.o or.o and.o sum.o arraysum.o basic_cmds.o -o calc_basic

calc_basicwithupper: calc.o upper.o or.o and.o sum.o arraysum.o basicwithupper_cmds.o
	ld -g calc.o upper.o or.o and.o sum.o arraysum.o basicwithupper_cmds.o -o calc_basicwithupper


calc_simpleone: calc.o upper.o or.o and.o sum.o arraysum.o simpleone_cmds.o
	ld -g calc.o upper.o or.o and.o sum.o arraysum.o simpleone_cmds.o -o calc_simpleone

calc_upperonly: calc.o or.o and.o sum.o upper.o arraysum.o upperonly_cmds.o 
	ld -g calc.o or.o and.o sum.o upper.o arraysum.o upperonly_cmds.o -o calc_upperonly

calc_arraysum: calc.o or.o and.o sum.o upper.o arraysum.o arraysum_cmds.o
	ld -g calc.o or.o and.o sum.o upper.o arraysum.o arraysum_cmds.o -o calc_arraysum
    
calc_easy: calc.o or.o and.o sum.o upper.o arraysum.o easy_cmds.o
	ld -g calc.o or.o and.o sum.o upper.o arraysum.o easy_cmds.o -o calc_easy
    
calc_simplerandom: calc.o or.o and.o sum.o upper.o arraysum.o simplerandom_cmds.o
	ld -g calc.o or.o and.o sum.o upper.o arraysum.o simplerandom_cmds.o -o calc_simplerandom
