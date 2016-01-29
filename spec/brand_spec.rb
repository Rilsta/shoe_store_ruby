require('spec_helper')

describe(Store) do
  it("denies blank input") do
    brand = Brand.new({brand_name: ""})
    expect(brand.save).to(eq(false))
  end

  it("Capitalizing first letters of words inputted") do
    brand = Brand.create({brand_name: "ran over"})
    expect(brand.brand_name).to(eq("Ran Over"))
  end
end
