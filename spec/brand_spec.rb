require('spec_helper')

describe(Store) do
  it("denies blank input") do
    brand = Brand.new({brand_name: ""})
    expect(brand.save).to(eq(false))
  end
end
