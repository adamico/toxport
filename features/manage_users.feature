Feature: Manage users
  In order to allow users to add records to the database
  An admin
  Should be able to manage users

  Background:
    Given I login as a admin with "admin" and "password"

  Scenario: Add a valid user
    When I go to the new user page
    And I fill in "user_username" with "username"
    And I fill in "user_email" with "username@example.com"
    And I fill in "user_password" with "password"
    And I fill in "user_password_confirmation" with "password"
    And I press "Créer un(e) Utilisateur"
    Then 1 user should exist

  Scenario: List users
    Given the following users exist:
      |username |email             |password|
      |tizio    |tizio@test.com    |secret  |
      |caio     |caio@test.com     |secret  |
      |sempronio|sempronio@test.com|secret  |
      |gaio     |gaio@test.com     |secret  |
    When I go to the users page
    Then I should see "tizio"
    And I should see "caio"
    And I should see "sempronio"
    And I should see "gaio"

  @focus
  Scenario: manual password reset for a user
    Given the following users exist:
      |username |email             |password|
      |tizio    |tizio@test.com    |secret  |
    When I go to the users page
    And I follow "Reset password"
    Then I should be on the new password page


