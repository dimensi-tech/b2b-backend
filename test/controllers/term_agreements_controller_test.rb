require 'test_helper'

class TermAgreementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @term_agreement = term_agreements(:one)
  end

  test "should get index" do
    get term_agreements_url
    assert_response :success
  end

  test "should get new" do
    get new_term_agreement_url
    assert_response :success
  end

  test "should create term_agreement" do
    assert_difference('TermAgreement.count') do
      post term_agreements_url, params: { term_agreement: { description: @term_agreement.description, name: @term_agreement.name } }
    end

    assert_redirected_to term_agreement_url(TermAgreement.last)
  end

  test "should show term_agreement" do
    get term_agreement_url(@term_agreement)
    assert_response :success
  end

  test "should get edit" do
    get edit_term_agreement_url(@term_agreement)
    assert_response :success
  end

  test "should update term_agreement" do
    patch term_agreement_url(@term_agreement), params: { term_agreement: { description: @term_agreement.description, name: @term_agreement.name } }
    assert_redirected_to term_agreement_url(@term_agreement)
  end

  test "should destroy term_agreement" do
    assert_difference('TermAgreement.count', -1) do
      delete term_agreement_url(@term_agreement)
    end

    assert_redirected_to term_agreements_url
  end
end
