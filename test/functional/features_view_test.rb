require 'test_helper'

#  REST actions: new, create, delete, index
module View
  class IndexTest < ActionController::TestCase
    tests FeaturesController
    
    def setup
      get :index
    end
    
    def each_feature
      @scrumspace.features.each { |f| yield f }
    end
    
    test "should have a form to create a new feature" do
      assert_select "form[action=/features]", 1
    end
    
    test "should have a form to update each existing feature" do
      each_feature do |f| 
        assert_select "form[action=/features/#{f.id}]", 1 
      end
    end
    
    test "should have a submit button" do
      each_feature do |f| 
        assert_select "form[action=/features/#{f.id}] button", 1
      end
    end
    
    test "should have textarea description" do
      each_feature do |f|
        assert_select "form[action=/features/#{f.id}] textarea[name=?]", /feature\[description\]/
      end
    end
    
    test "should have number select for estimate" do
      each_feature do |f|
        assert_select "form[action=/features/#{f.id}] select[name=?]", /feature\[estimate\]/
      end
    end
    
    test "should have a link to all demos" do
      assert_select "p#demos a:first-child[href=/features]", 1
    end
    
    test "should have a link to each demo" do
      # TODO: refactor to @scrumspace.sprints OR @scrumspace.demos
      @scrumspace.features.map {|f| f.demo.to_s(:db) }.uniq.each do |demo|
        assert_select "p#demos a[href=/sprints/#{demo}]", 1
      end
    end
    
    test "should have an subtotal of all estimations" do
      assert_select "#subtotal", :text => /#{@scrumspace.features.sum(:estimate)}/
    end
  end
end
