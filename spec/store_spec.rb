require('spec_helper')

describe(Store) do
  it("denies blank input") do
    store = Store.new({store_name: ""})
    expect(store.save).to(eq(false))
  end
end
