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

    Scenario: Clock displays UTC label text
        Given I open the site "https://time.gov"
        Then I expect that element ".clock" contains the text "Coordinated Universal Time"

    Scenario: Clock updates after a pause
        Given I open the site "https://time.gov"
        And I store the text of element ".clock-time" as "t0"
        When I pause for 2000ms
        And I store the text of element ".clock-time" as "t1"
        Then the stored value "t1" is not "${t0}"

    Scenario: User can click Pacific Time region
        Given I open the site "https://time.gov"
        When I click on the element "#Pacific"
        Then I expect that element ".clock" contains the text "Pacific Time"

    Scenario: User can click Mountain Time region
        Given I open the site "https://time.gov"
        When I click on the element "#Mountain"
        Then I expect that element ".clock" contains the text "Mountain Time"

    Scenario: Map image includes alt text
        Given I open the site "https://time.gov"
        Then I expect that element "img[alt]" is visible

    Scenario: Settings panel button is visible and opens panel
        Given I open the site "https://time.gov"
        Then I expect that element "#settings-button" is visible
        When I click on the element "#settings-button"
        Then I expect that element "#settings-panel" is visible

    Scenario: Footer contains government attribution
        Given I open the site "https://time.gov"
        Then I expect that element "footer" contains the text "U.S. Government"