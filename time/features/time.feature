Feature: Time.gov main page behaviors
    As a visitor
    I want to verify the core functionality of time.gov
    So that I know the page loads and behaves correctly

    Scenario: Page title loads correctly
        Given I open the url "https://time.gov"
        Then I expect that the title is "National Institute of Standards and Technology | NIST"

    Scenario: Map element is visible
        Given I open the site "https://time.gov"
        Then I expect that element ".full-img" is visible

    Scenario: Clock is visible on load
        Given I open the site "https://time.gov"
        Then I expect that element ".clock" is visible

    Scenario: Map image includes alt text
        Given I open the site "https://time.gov"
        Then I expect that the attribute "alt" from element "img.full-img" is "United States Time Zone Map"

    Scenario: MST label is displayed
        Given I open the site "https://time.gov"
        Then I expect that element ".green .sub-title" contains the text "MST (UTC-7)"

    Scenario: PST label is displayed
        Given I open the site "https://time.gov"
        Then I expect that element ".orange .sub-title" contains the text "PST (UTC-8)"

    Scenario: CST label is displayed
        Given I open the site "https://time.gov"
        Then I expect that element ".yellow .sub-title" contains the text "CST (UTC-6)"

    Scenario: EST label is displayed
        Given I open the site "https://time.gov"
        Then I expect that element ".red .sub-title" contains the text "EST (UTC-5)"
            
    Scenario: Clock displays UTC label text
        Given I open the site "https://time.gov"
        Then I expect that element "#clock-utc p" contains the text "Coordinated Universal Time (UTC)"

    Scenario: MST clock is visible and has some time text
        Given I open the site "https://time.gov"
        Then I wait on element ".clock-box.green.dst-clock .clock time" for 5000ms to be visible
  