require('spec_helper')

describe(Store) do
  it("denies blank input") do
    store = Store.new({store_name: ""})
    expect(store.save).to(eq(false))
  end

  it("Capitalizing first letters of words inputted") do
    store = Store.create({store_name: "sole survivor"})
    expect(store.store_name).to(eq("Sole Survivor"))
  end
end
