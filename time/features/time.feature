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
        Then I expect that element "img[alt]" is visible

