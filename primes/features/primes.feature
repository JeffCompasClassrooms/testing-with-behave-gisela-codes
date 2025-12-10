Feature: Test Big Primes number checker
  As a user who wants to verify prime numbers
  I want to use bigprimes.org to check if numbers are prime
  So that I can trust the results

Scenario: Check if a small prime number is recognized
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the prime number "7"
  And I click Test That Prime
  Then I should see that "7" is a prime number!

Scenario: Check if a small number is rejected
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the number "12"
  And I click Test That Prime
  Then I should see that "12" is not prime

Scenario: Check if a large prime number is recognized
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the large prime number "1000000007"
  And I click Test That Prime
  Then I should see that "1000000007" is a prime number!

Scenario: Check if a negative number is a negation
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the negative number "-5"
  And I click Test That Prime
  Then I should see that "-5" is the negation of a prime number!

Scenario: Verify page loads with title
  Given I open the bigprimes.org website
  Then I should see the page title contains "prime"

Scenario: Generate 2 primes with 2 digits
  Given I open the bigprimes.org website
  When I enter "2" for number of primes
  And I enter "2" for number of digits
  And I click Get more primes
  Then I should see a list of 2 primes

Scenario: Generate 5 primes with 3 digits
  Given I open the bigprimes.org website
  When I enter "5" for number of primes
  And I enter "3" for number of digits
  And I click Get more primes
  Then I should see a list of 5 primes

Scenario: Check if zero is not prime
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the number "0"
  And I click Test That Prime
  Then I should see that "0" is not prime

Scenario: Check if one is not prime
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the number "1"
  And I click Test That Prime
  Then I should see that "1" is not prime

Scenario: Check if a negative large number is a negation
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the negative number "-101"
  And I click Test That Prime
  Then I should see that "-101" is the negation of a prime number!

Scenario: Check if a very large number is rejected
  Given I open the bigprimes.org website
  When I navigate to primality test
  And I search for the number "1000000000"
  And I click Test That Prime
  Then I should see that "1000000000" is not prime

Scenario: Generate 1 prime with 1 digit
  Given I open the bigprimes.org website
  When I enter "1" for number of primes
  And I enter "1" for number of digits
  And I click Get more primes
  Then I should see a list of 1 primes

Scenario: Generate 10 primes with 2 digits
  Given I open the bigprimes.org website
  When I enter "10" for number of primes
  And I enter "2" for number of digits
  And I click Get more primes
  Then I should see a list of 10 primes

Scenario: Generate 3 primes with 4 digits
  Given I open the bigprimes.org website
  When I enter "3" for number of primes
  And I enter "4" for number of digits
  And I click Get more primes
  Then I should see a list of 3 primes

Scenario: Generate 7 primes with 5 digits
  Given I open the bigprimes.org website
  When I enter "7" for number of primes
  And I enter "5" for number of digits
  And I click Get more primes
  Then I should see a list of 7 primes