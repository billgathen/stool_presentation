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

