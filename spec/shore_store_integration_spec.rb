require('spec_helper')

describe('Shoe store pathways', :type => :feature) do
  it('adds a store to the list of stores') do
    visit('/')
    click_link('Store List')
    click_link('Add a New Store')
    fill_in('store_name', with: 'Shoeda Bought')
    click_button('Add')
    expect(page).to have_content('Shoeda Bought')
  end

  it('adds a brand to a store') do
    visit('/')
    click_link('Store List')
    click_link('Add a New Store')
    fill_in('store_name', with: 'Shoeda Bought')
    click_button('Add', :match => :first)
    click_link('Shoeda Bought')
    click_link('Add a Shoe Brand')
    fill_in('brand_name', with: 'Gotta Go Fast')
    click_button('Add', :match => :first)
    expect(page).to have_content('Gotta Go Fast')
  end

  it('edits store information') do
    visit('/')
    click_link('Store List')
    click_link('Add a New Store')
    fill_in('store_name', with: 'Shoeda Bought')
    click_button('Add', :match => :first)
    click_link('Edit')
    fill_in('store_name', with: 'Shin Sprints')
    click_button('Save Changes')
    expect(page).to have_content('Shin Sprints')
  end
end
