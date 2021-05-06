# Instance Variables Code-Along

## Learning Goals

- Define instance variables
- Distinguish instance variables from local variables
- Describe how instance variables give objects attributes and properties

## Introduction

When we build objects through our own classes we know we can add behavior to the
objects through instance methods. But how do we give our objects data? For
example, how would we teach a dog what its name is? Or what breed it is? How do
we put data inside of an instance of an object so that each dog can have its own
name and own breed? In other words, how do we give objects attributes or
properties?

## Instructions

Fork and clone this code-along, then run your tests with `learn test` to get an
overview of what we are trying to do. Follow along to get the tests to pass.

## What is an instance variable?

We've been working with variables for a while now. For example:

```ruby
bro_greeting = "Sup, bro?"
```

The code above sets a variable, `bro_greeting`, equal to the string `"Sup,
bro?"`. Now we can use that variable to read and operate on that string.

```ruby
bro_greeting #=> "Sup, bro?"

bro_greeting.upcase #=> "SUP, BRO?"
```

The `bro_greeting` variable is what's known as a **local variable**, so named
because it can only be accessed in a specific, local environment.

A local variable that is defined inside one method, for example, cannot be
accessed by another method. In order to get around this limitation, we can use
**instance variables** inside our Ruby classes.

An **instance variable** is a variable that is accessible in any instance method
in a particular instance of a class.

## We need instance variables

Let's say we have a class called `Dog` that is responsible for producing
individual dog objects. We want each dog instance to be able to have a name and
to show its name. So we need to write two methods: one to _set_ the dog's name
and one to _get_ the dog's name.

Open `dog.rb` inside the `lib` folder and add the following two methods to the
`Dog` class:

```ruby
class Dog
  def name=(dog_name)
    this_dogs_name = dog_name
  end

  def name
    this_dogs_name
  end
end
```

Here we've defined two instance methods, the `name=` (or "name equals") method,
and the `name` method. The first method takes in an argument of a dog's name and
assigns that value to a variable, `this_dogs_name`. The second method is
responsible for reporting the name. Our two methods therefore are responsible
for "setting" and "getting" an individual dog's name.

We want the methods to act as mechanisms to expose data from inside of the
object to the outside world; in other words, we want to be able to do this:

```ruby
lassie = Dog.new
lassie.name = "Lassie"

lassie.name #=> "Lassie"
```

In the code above, we are creating a new `Dog` instance and assigning it a name
then asking it to return its name.

In your `dog.rb` file add the above code. Run `learn test` again. You should see
output that includes something like this:

```bash
Failure/Error: this_dogs_name

NameError:
  undefined local variable or method `this_dogs_name' for #<Dog:0x00007fa7909a3078>
```

Uh-oh. Looks like the `#name` method doesn't know about the `this_dogs_name`
variable from the `#name=` method. That is because `this_dogs_name` is a **local
variable**. A local variable has a **local scope**, which means that it cannot be
accessed outside of the method in which it is defined.

## Implementing instance variables

We define an instance variable by prefacing the variable name with an `@`
symbol.

Instance variables are bound to an instance of a class. That means that when we
set the value of an attribute on an instance of a class, the value we set is
associated with that particular instance. This makes intuitive sense: a dog's
name belongs to that specific dog, not to `Dog`s in general. Instance variables
hold information about an instance, i.e., they describe _attributes_ or
_properties_ of the instance, such as its name or breed. They can be called on
throughout the class, without needing to be passed into other methods as
arguments (as would be the case with local variables).

Let's refactor our `Dog` class to use an instance variable instead of a local
variable to set and get an individual dog's name.

Inside `dog.rb`, change the `Dog` class in the following way:

```ruby
class Dog

  def name=(dogs_name)
    @this_dogs_name = dogs_name
  end

  def name
    @this_dogs_name
  end
end

lassie = Dog.new
lassie.name = "Lassie"

puts lassie.name

```

Run `learn test` again; your tests should now be passing.

To summarize: in Object-Oriented Ruby, we want to be able to set attributes on
the instances of our classes. We also want those objects to "know" the values of
their attributes. To do this, we create a _setter_ method, which takes an
argument and sets the instance variable equal to that value. We also create a
_getter_ method that will return the value of the instance variable. By using
the `@` in front of the variable name, the variable that's created inside the
_setter_ method is available inside the _getter_ method (and inside any other
methods in our class).

## Conclusion

As we dive deeper into object-oriented Ruby, we'll be using instance variables
frequently to pass information around the instance methods of a class. Think of
instance variables as the containers for instance-specific information. The
ability of instance variables to store information and be accessible within
different instance methods is one of the things that makes it possible for us to
create similar but unique objects in object-oriented Ruby.
