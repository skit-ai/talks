#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define life_interface void (*speak)(void *); void (*eat)(void *, char *);

typedef struct Life {
  life_interface;
} Life;

typedef struct Animal {
  life_interface;
  char* name;
} Animal;

typedef struct Plant {
  life_interface;
  char *name;
} Plant;

void _animal_speak(void *o) {
  Animal* an = (Animal*)(o);
  printf("hello fren, me %s\n", an->name);
}

void _animal_eat(void *o, char *food) {
  Animal *an = (Animal *)o;
  printf("i am a %s, i don't eat %s\n", an->name, food);
}

void _plant_speak(void *o) {
  Plant* pl = (Plant*)o;
  printf("plants like %s don't speak\n", pl->name);
}

void _plant_eat(void *o, char* food) {
  Plant *pl = (Plant *)o;
  printf("plants like %s only eat water\n", pl->name);
}

void _animal_set_name(Animal *an, char* new_name) {
  if (strcmp(new_name, "dog") == 0) {
    fprintf(stderr, ":: Can't make a dog, dogs are not animals. Defaulting to cat.\n");
    an->name = "cat";
  } else {
    an->name = new_name;
  }
}

Animal* make_animal(char* name) {
  Animal *an = malloc(sizeof(Animal));
  _animal_set_name(an, name);

  an->speak = _animal_speak;
  an->eat = _animal_eat;
  return an;
}

Plant* make_plant(char *name) {
  Plant *pl = malloc(sizeof(Plant));
  pl->name = name;
  pl->speak = _plant_speak;
  pl->eat = _plant_eat;
  return pl;
}

void* make_random_object() {
  float r = (float)rand() / (float)RAND_MAX;
  if (r < 0.5) {
    return (void *)make_plant("plant");
  } else {
    return (void *)make_animal("animal");
  }
}

int main (int argc, char** argv) {
  if (argc != 2) {
    printf("Usage: ./obj <animal-name>\n");
    return 1;
  }

  Animal *an = make_animal(argv[1]);
  an->speak(an);
  an->eat(an, "chicken");

  printf("\n");

  Plant *pl = make_plant(argv[1]);
  pl->speak(pl);
  pl->eat(pl, "charcoal");

  srand((unsigned int)time(NULL));
  Life *obj = make_random_object();
  obj->speak(obj);
}
