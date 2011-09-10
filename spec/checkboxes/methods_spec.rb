require "spec_helper"

describe "checkboxes_for" do

  context "with a bad relation" do
    it "raises an exception" do
      lambda {
        class User
          checkboxes_for :gropues
        end
      }.should raise_error(Checkboxes::Core::CheckboxesNameError)
    end
  end

  context "with a good association" do

    before(:each) do
      class User
        checkboxes_for :groups
      end
      @user = Factory(:user)
    end

    it "adds instance getter" do
      @user.should respond_to Checkboxes::Core::field_name(:groups)
    end

    it "adds instance setter" do
      @user.should respond_to "#{Checkboxes::Core::field_name(:groups)}=".to_sym
    end

    it "saves relations through added method" do
      g1 = Factory(:group)
      g2 = Factory(:group)
      @user.send("#{Checkboxes::Core::field_name(:groups)}=",[g1.id, g2.id])
      @user.should have(2).groups
    end

    it "delete relations through added method" do
      g1 = Factory(:group)
      g2 = Factory(:group)
      @user.send("#{Checkboxes::Core::field_name(:groups)}=",[g1.id, g2.id])
      @user.send("#{Checkboxes::Core::field_name(:groups)}=",[g1.id])
      @user.groups.should_not include g2
    end

  end

end
