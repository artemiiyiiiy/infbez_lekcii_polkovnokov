all: lec23_1 lec23_2 lec23_3 lec4_1 lec4_2 lec4_3

lec23_1: lekciya_2_3/prog1.c
	gcc -o lec23_1.out lekciya_2_3/prog1.c

lec23_2: lekciya_2_3/prog2.c
	gcc -o lec23_2.out lekciya_2_3/prog2.c

lec23_3: lekciya_2_3/prog3.c
	gcc -o lec23_3.out lekciya_2_3/prog3.c

lec4_1: lekciya_4/prog1.c
	gcc -o lec4_1.out lekciya_4/prog1.c

lec4_2: lekciya_4/prog2.c
	gcc -o lec4_2.out lekciya_4/prog2.c

lec4_3: lekciya_4/prog3.c
	gcc -o lec4_3.out lekciya_4/prog3.c
