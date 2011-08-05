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
