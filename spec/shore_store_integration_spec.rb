require('spec_helper')

describe('Shoe store pathways', :type => :feature) do
  it('adding a store to the list of stores') do
    visit('/')
    click_link('Store List')
    click_link('Add a New Store')
    fill_in('store_name', with: 'Shoeda Bought')
    click_button('Add')
    expect(page).to have_content('Shoeda Bought')
  end
end
