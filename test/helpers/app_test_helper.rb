def stub_product
  Product.stubs(:find_by_name).returns(@scrumspace)
end
