Feature: Show events
  In order to show events
  As a user
  I want to show events/index page

#todo データ再利用
#todo 項目名のalias
  
  Scenario: User can show event sorted by start date when events exist.
    Given the following event exists:
      | title       | url                  | started_at   | ended_at     | address |
      | test_event1 | http://example.com/1 | today        | tomorrow     | Tokyo   |
      | test_event2 | http://example.com/2 | 2 days since | 3 days since | Chiba   |
    When I go to the event index page
    Then I should see following table:
      | Date                                        | Title       | Address |
      | [today(MM/DD)]-[tomorrow(MM/DD)]            | test_event1 | Tokyo    |
      | [2 days since(MM/DD)]-[3 days since(MM/DD)] | test_event2 | Chiba    |
    And I should see link following:
      | name        | url                  |
      | test_event1 | http://example.com/1 |
      | test_event2 | http://example.com/2 |
    
  Scenario Outline: User can show event which don't finish.
    Given the following event exists:
      | title        | ended_at     | address |
      | target_event | <datetime>       | Tokyo   |
    When I go to the event index page
    Then I should <not see/see> "target_event"
    
    Examples:
       | datetime            | not see/see |
       | yesterday(time)     | not see     |
       | 1 hours ago(time)   | not see     |
       | 1 hours since(time) | see         |
       | tomorrow(time)      | see         |

  
  
  
  
  
    
  
