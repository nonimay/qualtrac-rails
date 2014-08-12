Feature: Members Page

  Scenario: Viewing the members index page
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members page
    Then I should see "Fiona McDonald 1370" on the page
