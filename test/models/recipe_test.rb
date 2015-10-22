require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname:"John",email:"john@example.com")
    @recipe = @chef.recipes.build(name:"My new Recipe",summary:"My new recipe that is reaaly good",description:"recipe is small but ok and minimalitic is the way to go home. I think so!")
  end
  
  test "recipe sould be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id sould be present" do
    @recipe.chef_id= nil
    assert_not @recipe.valid?
  end
  
  test "name sould be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length sohuld not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length sohuld no be to short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "Summary must be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be to long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be to short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Desciprtion must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Descirption length shoud not be to long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "decription length should not be to short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end