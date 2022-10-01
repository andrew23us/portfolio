@quote_pred
  Feature: Quote predefined
    @quote_pred0
    Scenario: Username validation
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "a" into element with xpath "//input[@name='username']"
      And I click on element with xpath "//input[@name='email']"
      Then element with xpath "//label[@id='username-error']" should contain text "2 characters"
      When I clear element with xpath "//input[@name='username']"
      And I type "ab" into element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='username-error']" should not be displayed
    @quote_pred1
    Scenario: Email validation
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      # abc input
      When I type "abc" into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='email-error']" should contain text "enter a valid email"
      When I clear element with xpath "//input[@name='email']"
      # abc@abc. input
      When I type "abc@abc." into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='email-error']" should contain text "enter a valid email"
      When I clear element with xpath "//input[@name='email']"
      # @abc@abc.com input
      When I type "@abc@abc.com" into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='email-error']" should contain text "enter a valid email"
      When I clear element with xpath "//input[@name='email']"
      # abc@@abc.com input
      When I type "abc@@abc.com" into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='email-error']" should contain text "enter a valid email"
      When I clear element with xpath "//input[@name='email']"
      # ab c@abc.com input
      When I type "ab c@abc.com" into element with xpath "//input[@name='email']"
      And I click on element with xpath "//input[@name='username']"
      Then element with xpath "//label[@id='email-error']" should contain text "enter a valid email"
      When I clear element with xpath "//input[@name='email']"
      # abc@abc.com input
      And I type "abc@abc.com" into element with xpath "//input[@name='email']"
      Then element with xpath "//label[@id='email-error']" should not be displayed
    @quote_pred2
    Scenario: Confirm password is disabled validation
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      And element with xpath "//input[@id='confirmPassword']" should be disabled
    @quote_pred3
    Scenario: Password validation
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "1234" into element with xpath "//input[@id='password']"
      And I click on element with xpath "//input[@name='email']"
      Then element with xpath "//label[@id='password-error']" should contain text "5 characters"
      When I clear element with xpath "//input[@id='password']"
      And I type "12345" into element with xpath "//input[@id='password']"
      Then element with xpath "//label[@id='password-error']" should not be displayed
    @quote_pred4
    Scenario: Error msg for mismatch Password and Confirm password
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I type "12345" into element with xpath "//input[@name='password']"
      And I type "123456" into element with xpath "//input[@id='confirmPassword']"
      And I click on element with xpath "//input[@name='password']"
      Then element with xpath "//label[@id='confirmPassword-error']" should contain text "do not match"
    @quote_pred5
    Scenario: Name validation
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//input[@id='name']"
      Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
      When I type "Peter" into element with xpath "//input[@id='firstName']"
      And I type "Orange" into element with xpath "//input[@id='lastName']"
      And I click on element with xpath "//span[contains(text(),'Save')]"
      Then element with xpath "//input[@id='name']" should have attribute "value" as "Peter Orange"
    @quote_pred6
    Scenario: DOB
      Given I open url "https://skryabin.com/market/quote.html"
      Then I should see page title as "Get a Quote"
      When I click on element with xpath "//input[@id='dateOfBirth']"
      Then element with xpath "//div[@id='ui-datepicker-div']" should be displayed
      When I click on element with xpath "//option[@value='6']"
      And I click on element with xpath "//option[contains(text(),'1985')]"
      And I click on element with xpath "//a[contains(text(),'13')]"
      Then element with xpath "//input[@id='dateOfBirth']" should have attribute "value" as "07/13/1985"
      @quote_pred7
      Scenario: 3rd party button and pop-up validation
        Given I open url "https://skryabin.com/market/quote.html"
        Then I should see page title as "Get a Quote"
        When I click on element with xpath "//button[@id='thirdPartyButton']"
        And I accept alert
      @quote_pred8
      Scenario: Documents button and new window validation
        Given I open url "https://skryabin.com/market/quote.html"
        Then I should see page title as "Get a Quote"
        When I click on element with xpath "//button[contains(text(),'Related documents (click)')]"
        And I switch to new window
        Then element with xpath "//body" should contain text "Document 1"
        And I switch to first window
      @quote_pred9
      Scenario: iframe validation
        Given I open url "https://skryabin.com/market/quote.html"
        Then I should see page title as "Get a Quote"
        When I switch to iframe with xpath "//iframe[@name='additionalInfo']"
        And I type "Alex Kale" into element with xpath "//input[@id='contactPersonName']"
        And I type "9175848778" into element with xpath "//input[@id='contactPersonPhone']"
        And I switch to default content
      @quote_pred10
      Scenario: Submit with all required fields and verify submitted data
        Given I open url "https://skryabin.com/market/quote.html"
        Then I should see page title as "Get a Quote"
        # username
        And I type "ab" into element with xpath "//input[@name='username']"
        # email
        And I type "abc@abc.com" into element with xpath "//input[@name='email']"
        # password
        And I type "12345" into element with xpath "//input[@id='password']"
        # confirm password
        And I type "12345" into element with xpath "//input[@id='confirmPassword']"
        # name
        And I click on element with xpath "//input[@id='name']"
        Then element with xpath "//div[@aria-describedby='nameDialog']" should be displayed
        And I type "Andrew" into element with xpath "//input[@id='firstName']"
        And I type "Zyuzikov" into element with xpath "//input[@id='lastName']"
        And I click on element with xpath "//span[contains(text(),'Save')]"
        Then element with xpath "//input[@id='name']" should have attribute "value" as "Andrew Zyuzikov"
        # check-box privacy
        When I click on element with xpath "//input[@name='agreedToPrivacyPolicy']"
        Then element with xpath "//input[@name='agreedToPrivacyPolicy']" should have attribute "class" as "ng-untouched ng-valid ng-dirty ng-valid-parse"
        # submit
        When I click on element with xpath "//button[@id='formSubmit']"
        Then element with xpath "//legend[contains(text(),'Submitted Application')]" should be displayed
        And element with xpath "//b[@name='firstName']" should contain text "Andrew"
        And element with xpath "//b[@name='lastName']" should contain text "Zyuzikov"
        And element with xpath "//b[@name='name']" should contain text "Andrew Zyuzikov"
        And element with xpath "//b[@name='password']" should contain text "[entered]"
        And element with xpath "//b[@name='username']" should contain text "ab"
        And element with xpath "//b[@name='email']" should contain text "abc@abc.com"

        


