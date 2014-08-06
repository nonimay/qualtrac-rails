Feature: Members Page

  Scenario: Viewing the members index page
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members page
    Then I should see "Fiona McDonald 1370" on the page

  Scenario: Viewing the members index page with several members
    Given there are several members in the system
    When I am on the members page
    Then I should see all the members on the page

  Scenario: Edit member details
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members editing page and change first name to "Fion" and last name to "MacDonald"
    Then I should see "Fion MacDonald 1370" on the page

  Scenario: Edit member deatils leave first name blank
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members editing page and leave first name blank
    Then I should see "First name can't be blank" error message on the page

  Scenario: Edit member deatils leave last name blank
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members editing page and leave last name blank
    Then I should see "Last name can't be blank" error message on the page

  Scenario: Edit member deatils leave membership number blank
    Given there's a member with first name "Fiona", last name "McDonald" and membership number '1370'
    When I am on the members editing page and leave membership number blank
    Then I should see "Membership number can't be blank" error message on the page
