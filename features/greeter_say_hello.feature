Feature: greet say hello

  In order to start learning Rspec and CuCumber
  As a reader of The Rspec Book
  I want a greeter to say Hello
  
  Scenario: greeter says hello
    Given a greeter
    When I send it  the greet message 
    Then I should see "Hello CuCumber!"
    
