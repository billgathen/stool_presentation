describe 'fizzbuzz' do
  it 'a single number' do
    fizzbuzz_a_number(9).should == "Fizz"
    fizzbuzz_a_number(10).should == "Buzz"
    fizzbuzz_a_number(11).should == "11"
    fizzbuzz_a_number(30).should == "FizzBuzz"
  end
end

