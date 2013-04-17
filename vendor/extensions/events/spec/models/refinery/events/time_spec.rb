require 'spec_helper'

module Refinery
  module Events
    describe Time do
      describe "validations" do
        subject do
          FactoryGirl.create(:time)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
