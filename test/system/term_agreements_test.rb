require "application_system_test_case"

class TermAgreementsTest < ApplicationSystemTestCase
  setup do
    @term_agreement = term_agreements(:one)
  end

  test "visiting the index" do
    visit term_agreements_url
    assert_selector "h1", text: "Term Agreements"
  end

  test "creating a Term agreement" do
    visit term_agreements_url
    click_on "New Term Agreement"

    fill_in "Description", with: @term_agreement.description
    fill_in "Name", with: @term_agreement.name
    click_on "Create Term agreement"

    assert_text "Term agreement was successfully created"
    click_on "Back"
  end

  test "updating a Term agreement" do
    visit term_agreements_url
    click_on "Edit", match: :first

    fill_in "Description", with: @term_agreement.description
    fill_in "Name", with: @term_agreement.name
    click_on "Update Term agreement"

    assert_text "Term agreement was successfully updated"
    click_on "Back"
  end

  test "destroying a Term agreement" do
    visit term_agreements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Term agreement was successfully destroyed"
  end
end
