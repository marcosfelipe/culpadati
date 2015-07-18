require 'rails_helper'

describe 'home page', :js => true do
  it 'welcomes the user' do
    visit '/'
    expect(page).to have_content('Culpa da TI')
  end

  # tests if alert text apears and text is...
  # it 'click in button and shows #oi text' do
  # 	visit '/'
  # 	find('#oi').click
  # 	alert_text = page.driver.browser.switch_to.alert.text
  # 	assert alert_text == '#oi'
  # end
end