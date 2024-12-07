require "application_system_test_case"

class ShortenUrlsTest < ApplicationSystemTestCase
  setup do
    @shorten_url = shorten_urls(:one)
  end

  test "visiting the index" do
    visit shorten_urls_url
    assert_selector "h1", text: "Shorten Urls"
  end

  test "creating a Shorten url" do
    visit shorten_urls_url
    click_on "New Shorten Url"

    fill_in "Original url", with: @shorten_url.original_url
    fill_in "Short url", with: @shorten_url.short_url
    click_on "Create Shorten url"

    assert_text "Shorten url was successfully created"
    click_on "Back"
  end

  test "updating a Shorten url" do
    visit shorten_urls_url
    click_on "Edit", match: :first

    fill_in "Original url", with: @shorten_url.original_url
    fill_in "Short url", with: @shorten_url.short_url
    click_on "Update Shorten url"

    assert_text "Shorten url was successfully updated"
    click_on "Back"
  end

  test "destroying a Shorten url" do
    visit shorten_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shorten url was successfully destroyed"
  end
end
