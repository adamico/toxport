Feature: Authentication
  In order to restrict write access to authorized users
  A user
  Should authenticate themselves to the application
  To avoid wasting time

  Scenario Outline: user tries to authenticate
    Given the following users exist:
      |username|password|email             |
      |myuser  |mypass  |myuser@example.com|
    When I visit the user authentication page
    And I enter the username "<username>"
    And I enter the password "<password>"
    And I press the "devise.common.sign_in" button
    Then I should <expectation> a "devise.sessions.signed_in" message
    Examples:
      | username  | password  | expectation |
      | myuser    | mypass    | see         |
      | tizio     | pass      | not see     |

  Scenario: log out
    When I login
    And I logout
    Then I should see a "devise.sessions.signed_out" message
    And I should see a "devise.common.sign_in" message
