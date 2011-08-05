Feature: Authentication
  In order to restrict write access to authorized users
  A user
  Should authenticate themselves to the application
  To avoid wasting time

  Scenario Outline: logging in
    When I login as a <resource> with "<username>" and "<password>"
    Then I should see a "devise.sessions.signed_in" message
    Examples:
      | resource  | username | password  |
      | user      | myuser   | secret    |
      | admin     | myadmin  | secret    |

  Scenario Outline: loggin out
    When I login as a <resource> with "user" and "password"
    And I logout
    And I should see a "devise.common.sign_in" message
    Examples:
      | resource |
      | user     |
      | admin    |
