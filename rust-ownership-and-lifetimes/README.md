# Rust Ownership and Lifetimes Talk

## Ownership

Simple move
```rust
fn main() {
    let v = vec![1, 2, 3];

    let v2 = v;

    println!("v[0] is: {}", v[0]);
}
```

### Why ownership? 

See this demo cpp code.
```cpp
#include <iostream>
using namespace std;

void take(int *ptr) {
    for (int i=0; i<5; i++) {
		cout << *(ptr+i) << " ";
	}
	free(ptr);
}

int main() {
    int *ptr;
	ptr = (int*) malloc(5*sizeof(int));

	for (int i=0; i<5; i++) {
		ptr[i] = i;
	}
	take(ptr);

	cout << "\nPrinting Garbage" << endl;

	for (int i=0; i<5; i++) {
		cout << *(ptr+i) << " ";
	}
	return 0;
}
```

### Copy Trait

```rust
#[derive(Debug, Clone, Copy)]
struct A {
    a: i32
}

impl A {
    fn new(a: i32) -> Self {
        A{a: a}
    }
}

fn take(mut v: A) {
    v.a = 12;
    
    println!("inside take: v is: {:?}", v);
}

fn main() {
    let mut v = A::new(10);

    take(v);

    println!("v is: {:?}", v);
}
```

- Return ownership

```rust
fn take(mut v: Vec<i32>) -> Vec<i32> {
    // do stuff with v
    v[2] = 4;

    // hand back ownership
    v
}

fn main() {
    let mut v = vec![1, 2, 3];

    v = take(v);

    println!("v is: {:?}", v);
}
```


## Borrowing

```rust
fn take(v: &Vec<i32>) {
    // do stuff with v
    // v[2] = 4;

}

fn main() {
    let mut v = vec![1, 2, 3];

    take(&v);

    println!("v is: {:?}", v);
}
```


Issues it prevents

- use after free
```rust
fn main() {
    let y:&mut i32;
    {
        let mut x = 5;
        y = &mut x;
    }
    
    println!("{}", y);
}
```


### Rules

- References must be valid
- Only one immutable borrow

```rust
fn main() {
    let mut v = String::from("hello");

    let r1 = &mut v;
    let r2 = &mut v;

    println!("{}, {}", r1, r2);
}
```


## Lifetimes


```rust
struct Foo<'a> {
    x: &'a i32,
}

fn main() {
    let y = &5;
    let f = Foo { x: y };

    println!("{}", f.x);
}
```


Usage
```rust
struct Foo<'a> {
    x: &'a i32,
}

fn main() {
    let x;                    // -+ x goes into scope
                              //  |
    {                         //  |
        let y = &5;           // ---+ y goes into scope
        let f = Foo { x: y }; // ---+ f goes into scope
        x = &f.x;             //  | | error here
    }                         // ---+ f and y go out of scope
                              //  |
    println!("{}", x);        //  |
}                             // -+ x goes out of scope

```

### Multiple lifetimes

```rust
fn longest<'a, 'b:'a>(x: &'a str, y: &'b str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```
