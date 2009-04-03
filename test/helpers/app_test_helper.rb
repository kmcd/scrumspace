def login_with(account)
  Session.create(account)
  # FIXME: pass in product name with request URI instead
  Product.stubs(:find_by_name).returns(@scrumspace)
end

def assert_invalid(&blk)
  assert_raise(ActiveRecord::RecordInvalid) { blk.call }
end
