slide
=====

“You’ve mentioned testing and refactoring, but there’s a third leg to the stool: that’s design.” - Zach Dennis

slide
=====

7 Degrees of FizzBuzz page

slide
=====

The Tools
---------

>  Testing: unit test
>  Refactoring: Extract Method
>  Design: composition

slide
=====

The Challenge
-------------

> Output a set of numbers (say, 1-15), but whenever a number is divisible by 3, you output “Fizz” instead. If it’s divisible by 5, you output “Buzz” instead. If it’s divisible by 3 and 5, you output “FizzBuzz” instead.

slide
=====

"Go Ahead, Make a Mess" - Sandi Metz

Screenshot http://confreaks.com/videos/1115-gogaruco2012-go-ahead-make-a-mess

slide
=====

Code -- First draft
-------------------

def fizzbuzz last_num
  (1..last_num).map do |n|
    if n % 3 && n % 5
      "FizzBuzz"
    elsif n % 5
      "Buzz"
    elsif n % 3
      "Fizz"
    end
  end
end

puts fizzbuzz(30).join(" ")

slide
=====

> Composition: assembling something out of component parts

slide
=====

Basic level of composition: the method
--------------------------------------

Repeat original version code slide

slide
=====

We'll talk about integration another day
----------------------------------------

```
def some_data
  [ 1, 2, 3 ]
end

def output data
  puts data
end

output(some_data) # integrated
```

slide
=====

#fail
-----

```
$ ruby fizzbuzz.rb
FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz FizzBuzz
```

slide
=====

Then Make It Right (Testing)
----------------------------

slide
=====

> Testing: exercising program code in order to prove it functions as expected in all the important ways it might be used or abused.

slide
=====

Test -- First Draft
-------------------

```
describe 'fizzbuzz' do
  it 'works to 30' do
    fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Buzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
  end
end
```

slide
=====

#fail #fail
-----------

```
$ rspec stool_spec.rb 
F

Failures:

  1) fizzbuzz works to 30
     Failure/Error: fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Buzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
       expected: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "Buzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"]
            got: ["FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz", "FizzBuzz"] (using ==)
```

slide
=====

Writing tests like that is one reason people give up testing: it's EXHAUSTING.
------------------------------------------------------------------------------

slide
=====

Add the == 0
------------

```
def fizzbuzz last_num
  (1..last_num).map do |n|
    if n % 3 == 0 && n % 5 == 0
      "FizzBuzz"
    elsif n % 5 == 0
      "Buzz"
    elsif n % 3 == 0
      "Fizz"
    end
  end
end
```

slide
=====

#failagain
----------

```
$ rspec stool_spec.rb 
F

Failures:

  1) fizzbuzz works to 30
       Failure/Error: fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Buzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
             expected: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "Buzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"]
                  got: [nil, nil, "Fizz", nil, "Buzz", "Fizz", nil, nil, "Fizz", "Buzz", nil, "Fizz", nil, nil, "FizzBuzz", nil, nil, "Fizz", nil, "Buzz", "Fizz", nil, nil, "Fizz", "Buzz", nil, "Fizz", nil, nil, "FizzBuzz"] (using ==)
```

slide
=====

Add the else
------------

```
def fizzbuzz last_num
  (1..last_num).map do |n|
    if n % 3 == 0 && n % 5 == 0
      "FizzBuzz"
    elsif n % 5 == 0
      "Buzz"
    elsif n % 3 == 0
      "Fizz"
    else
      n.to_s
    end
  end
end
```

slide
=====

#grrrrrrr
---------

```
$ rspec stool_spec.rb 
F

Failures:

  1) fizzbuzz works to 30
     Failure/Error: fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Buzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
           expected: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "Buzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"]
                got: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"] (using ==)
```

slide
=====

Bugs in your tests are another reason people give up testing. *headdesk*
------------------------------------------------------------------------

slide
=====

Test I want to write
--------------------

```
describe 'fizzbuzz' do
  it 'a single number' do
    fizzbuzz_a_number(9).should == "Fizz"
    fizzbuzz_a_number(10).should == "Buzz"
    fizzbuzz_a_number(11).should == "11"
    fizzbuzz_a_number(30).should == "FizzBuzz"
  end
end
```

slide
=====

(TDD left as an exercise for the reader)
----------------------------------------

slide
=====

Can't write the test I want, because we don't have *enough* composition
-----------------------------------------------------------------------

Too many responsibilities (see: Single Responsibility Principle)

1. Iterate over an array
2. Fizzbuzz each number

slide
=====

Then Make It Easy
-----------------

slide
=====

> Refactoring: improving the structure of code without changing its external behavior.

slide
=====

Pics of Martin Fowler, Refactoring, Refactoring Ruby

slide
=====

Extract Method
--------------

1. Create new method with intention-revealing name: copy code into new method
2. Find vars created outside but used inside: add them as method arguments
3. Find vars created/modified inside but used outside: set as return value
4. Test the new method
5. Replace the original code with a call to the new method
6. New and old tests should still pass

slide
=====

1. Create new method with intention-revealing name: copy code into new method
-----------------------------------------------------------------------------

```
def fizzbuzz_a_number
  if n % 3 == 0 && n % 5 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end
``

slide
=====

2. Find vars created outside but used inside: add them as method arguments
--------------------------------------------------------------------------

```
def fizzbuzz_a_number n
  if n % 3 == 0 && n % 5 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end
```

slide
=====

3. Find vars created/modified inside but used outside: set as return value
--------------------------------------------------------------------------

```
def fizzbuzz_a_number n
  if n % 3 == 0 && n % 5 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end
```

slide
=====

4. Test the new method
----------------------

```
rspec stool_spec.rb 
..

Finished in 0.00051 seconds
2 examples, 0 failures
```

slide
=====

5. Replace the original code with a call to the new method
----------------------------------------------------------

```
def fizzbuzz_a_number n
  if n % 3 == 0 && n % 5 == 0
    "FizzBuzz"
  elsif n % 5 == 0
    "Buzz"
  elsif n % 3 == 0
    "Fizz"
  else
    n.to_s
  end
end

def fizzbuzz last_num
  (1..last_num).map do |n|
    fizzbuzz_a_number(n)
  end
end
```

slide
=====

6. New and old tests should still pass
--------------------------------------

```
rspec stool_spec.rb 
..

Finished in 0.00051 seconds
2 examples, 0 failures
```

slide
=====

Do we need both? Let's compare failures
---------------------------------------

```
if n % 3 == 0 && n % 5
  "FizzBuzz"
```

slide
=====

It's your choice
----------------

```
$ rspec stool_spec.rb 
FF

Failures:

  1) fizzbuzz a single number
     Failure/Error: fizzbuzz_a_number(9).should == "Fizz"
       expected: "Fizz"
            got: "FizzBuzz" (using ==)
     # ./stool_spec.rb:23:in `block (2 levels) in <top (required)>'

  2) fizzbuzz works to 30
     Failure/Error: fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 FizzBuzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
       expected: ["1", "2", "Fizz", "4", "Buzz", "Fizz", "7", "8", "Fizz", "Buzz", "11", "Fizz", "13", "14", "FizzBuzz", "16", "17", "Fizz", "19", "Buzz", "Fizz", "22", "23", "Fizz", "Buzz", "26", "Fizz", "28", "29", "FizzBuzz"]
            got: ["1", "2", "FizzBuzz", "4", "Buzz", "FizzBuzz", "7", "8", "FizzBuzz", "Buzz", "11", "FizzBuzz", "13", "14", "FizzBuzz", "16", "17", "FizzBuzz", "19", "Buzz", "FizzBuzz", "22", "23", "FizzBuzz", "Buzz", "26", "FizzBuzz", "28", "29", "FizzBuzz"] (using ==)
```

slide
=====

The Three-Legged Stool
----------------------

(graphic)
Program correctness --> Tests
High-quality tests --> Design for testability
Design for testability --> Design + refactoring
