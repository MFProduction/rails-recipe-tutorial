require "test_helper"

class ChefTest < ActiveSupport::TestCase
  def setup 
    @chef = Chef.new(chefname:"John", email:"john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef sould be present" do
    @chef.chefname =" "
    assert_not @chef.valid?
  end
  
  test "chefname sould not be to long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname sould not be to short" do
    @chef.chefname = "aaa"
    assert_not @chef.valid?
  end
  
  test "email sould be present" do
    @chef.email =" "
    assert_not @chef.valid?
  end
  
  test "email length sould be within bounds" do
    @chef.email ="a" * 101, "@examle.com"
    assert_not @chef.valid?
  end
  
  test "email should be uniqe" do
    dup_chef =@chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "Email validation sould exccept valid addresses" do
    valid_addreses = %w[user@eee.com R_TDO-DS@eee.hello.org user@example.com first.last@eee.au laura.joe@neki.cm]
    valid_addreses.each do |val|
      @chef.email = val
      assert @chef.valid?, "#{val.inspect} sould be valid"
    end
  end
  
  test "email validation sould reject invalid addresses" do
    invalid_addresses = %w[@example.com user_at_eee.org user.name@example. eepi_AM.com fooeee+arr.com]
    invalid_addresses.each do |ia| 
      @chef.email = ia
      assert_not @chef.valid?, "#{ia.inspect} sould be invalid"
    end
  end
end