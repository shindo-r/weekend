Feature: Gain events
  In order to provide events infomation
  As a admin
  I want to gain event's infomation to DB from api
  
  Scenario: System download event's infomation from ATND
    Given "http://api.atnd.org/events/?" send following json:
      """
      <?xml version="1.0" encoding="UTF-8"?>
      <hash>
        <results_returned type="integer">2</results_returned>
        <results_available type="integer">2</results_available>
        <results_start type="integer">1</results_start>
        <events type="array">
          <event>
            <title>title1</title>
            <catch>catch1</catch>
            <description>descriptio1</description>
            <event_url>http://example.com/1</event_url>
            <started_at type="datetime">[today(time)]</started_at>
            <ended_at type="datetime">[tomorrow(time)]</ended_at>
            <address>address1</address>
            <place>place1</place>
            <lat type="decimal">10.1</lat>
            <lon type="decimal">20.1</lon>
          </event>
          <event>
            <title>title2</title>
            <catch>catch2</catch>
            <description>descriptio2</description>
            <event_url>http://example.com/2</event_url>
            <started_at type="datetime">[2 days since(time)]</started_at>
            <ended_at type="datetime">[3 days since(time)]</ended_at>
            <address>address2</address>
            <place>place2</place>
            <lat type="decimal">10.2</lat>
            <lon type="decimal">20.2</lon>
          </event>
        </events>
      </hash>
      """
    When "gain_event" task runs
    Then following event should be gained:
      | title  | url                  | description        | address         | lon  | lat  | started_at         | ended_at           |
      | title1 | http://example.com/1 | catch1 descriptio1 | address1 place1 | 20.1 | 10.1 | today(time)        | tomorrow(time)     |
      | title2 | http://example.com/2 | catch2 descriptio2 | address2 place2 | 20.2 | 10.2 | 2 days since(time) | 3 days since(time) |
    
  
  
  

  
