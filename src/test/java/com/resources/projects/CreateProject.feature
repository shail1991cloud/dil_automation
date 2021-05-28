@CreateProject

Feature:Creation of Projects and validation of Project Setting Pop Up
  As a user I want to Create a Project,Validate the Project Setting Pop Up
  and validate the Project Listing Page with different fields

  @Smoke @Test1
  Scenario: user is able to validate Project Setting PopUp
    Given user is on DIL login page
    When  enter username and password
    And   clicks on createProject tab
    Then  all the fields on Project Setting up page are validated

    @Smoke @Test2
    Scenario Outline: user is not able to create Project when left mandatory field blank
      Given user is on DIL login page
      When  enter username and password
      And   clicks on createProject tab
      When enters "<projectname>","<Description>","<Tag>" with empty description and select engine
      Then submit button is displaying disable
      Examples:
        | projectname | Description      | Tag  |
        | DemoProject |                  | Test |

  @Smoke @Test3
  Scenario Outline: user is able to Cancel a Project on Project Setting Pop up and should not be able to get same project in ProjectListing Page
    Given user is on DIL login page
    When  enter username and password
    And clicks on createProject tab
    When enters "<projectname>","<Description>","<Tag>" and select engine and Cancel
    Then created "<projectname>"is not validated in project listing page
    Examples:
      | projectname | Description      | Tag  |
      | DemoProject | CreatingPipeLine | Test |


  @Smoke @Test4
  Scenario Outline: user is able to create a Project and should be able to validate same in ProjectListing Page
    Given user is on DIL login page
    When  enter username and password
    And clicks on createProject tab
    When enters "<projectname>","<Description>","<Tag>" and select engine
    Then created "<projectname>"is validated in project listing page
    Examples:
      | projectname | Description      | Tag  |
      | DemoProject | CreatingPipeLine | Test |

  @Smoke @Test5
  Scenario Outline: user is not able to find deleted project on ProjectListing Page
    Given user is on DIL login page
    When  enter username and password
    And clicks on createProject tab
    When enters "<projectname>","<Description>","<Tag>" and select engine
    Then created "<projectname>"is validated in project listing page
    When deletes the project
    Then created "<projectname>" disappear from Project Listing Page
    Examples:
      | projectname | Description      | Tag  |
      | DemoProject | CreatingPipeLine | Test |

  @Smoke @Test6
  Scenario: user is able to delete all Projects from Project listing page
    Given user is on DIL login page
    When  enter username and password
    Then  he should be able to delete all the Projects from Project Listing Page