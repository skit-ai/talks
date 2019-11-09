// method signature interfaces
package main

import "fmt"

type God interface {
	kick()
}

type Dog struct {
	name string
}

type Cat struct {
	name string
}

func check(g God) {
	g.kick()
}

func (d Dog) lick() {
	fmt.Println("licked")
}

func (d Dog) kick() {
	fmt.Println("kicked")
}

func main() {
	var d = Dog{}
	var c = Cat{}
	d.kick()

	check(d)
	check(c)
}
