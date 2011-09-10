require "spec_helper"

describe "helper method" do

  before(:each) do
    @user = Factory(:user)
    @template = ActionView::Base.new
    @builder = ActionView::Helpers::FormBuilder.new(:user, @user, @template, {}, proc {})
  end

  context "with a bad relation" do
    it "raises an exception" do
      lambda { @builder.checkboxes_for :groupes }.should raise_error
    end
  end

  context "with a good relation" do

    before(:each) do
      @user.groups << Factory(:group)
      @output_buffer = @builder.checkboxes_for :groups
    end

    it "contains a label for the given relation" do
      @output_buffer.should have_tag("label",/#{:groups.to_s.camelize}/)
    end

    it "contains a checked checkbox for each relation" do
      @output_buffer.should have_tag("input[@checked]", :count=>@user.groups.count)
    end

  end

end
