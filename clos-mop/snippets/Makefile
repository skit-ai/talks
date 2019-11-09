all: cobj Obj.class

Obj.class: ./Obj.java
	javac ./Obj.java

cobj: ./obj.c
	gcc -std=c11 ./obj.c -o cobj
