// Popular definition of OOP

class Animal {
    private int legs;
    public String name;

    Animal(String name, int legs) {
        this.name = name;
        this.legs = legs;
    }

    public void speak() {
        System.out.println(this.name + " has " + this.legs + " leg(s)");
    }
}


class Cow extends Animal {
    Cow(String name) {
        super(name, 4);
    }

    public void speak() {
        super.speak();
        System.out.println("btw, moo!");
    }
}

class Obj {
    public static void main (String args[]) {
        Animal an = new Animal("abhinav", 3);
        an.speak();

        Cow c = new Cow("cow");
        c.speak();
    }
}
