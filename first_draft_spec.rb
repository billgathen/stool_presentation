describe 'fizzbuzz' do
  it 'works to 30' do
    fizzbuzz(30).should == %w{ 1 2 Fizz 4 Buzz Fizz 7 8 Fizz Buzz 11 Fizz 13 14 Buzz 16 17 Fizz 19 Buzz Fizz 22 23 Fizz Buzz 26 Fizz 28 29 FizzBuzz }
  end
end

