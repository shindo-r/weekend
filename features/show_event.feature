Feature: Show event
  In order to show events
  As a user
  I want to show events/index page
  
  Scenario: User can show event's data sorted by start date when events exist.
    Given There are following events.
      | name        | url                  | start_at      | end_at        | location |
      | test_event1 | http://example.com/1 | [today]       | [tomorrow]    | Tokyo    |
      | test_event2 | http://example.com/2 | [today+2days] | [today+3days] | Chiba    |
    When I go to events/index.
    Then I show the following table.
      | Date                                   | Name                                    | Location |
      | [today(MMDD)]-[tomorrow(MMDD)]         | [link(test_event1,http://example.com/1) | Tokyo    |
      | [today+2day(MMDD)]-[today+3days(MMDD)] | [link(test_event2,http://example.com/1) | Chiba    |
    
  
  
  
  
  
    
  
