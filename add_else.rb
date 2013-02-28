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

