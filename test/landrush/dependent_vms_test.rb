require 'test_helper'

module Landrush
  describe DependentVMs do
    describe "any?" do
      it "reports false when nothing has happened" do
        DependentVMs.any?.must_equal false
      end

      it "reports true once a machine has been added" do
        DependentVMs.add('recordme.example.dev')
        DependentVMs.any?.must_equal true
      end

      it "reports false if a machine has been added then removed" do
        DependentVMs.add('recordme.example.dev')
        DependentVMs.remove('recordme.example.dev')
        DependentVMs.any?.must_equal false
      end

      it "reports true if not all machines have been removed" do
        DependentVMs.add('recordme.example.dev')
        DependentVMs.add('alsome.example.dev')
        DependentVMs.remove('recordme.example.dev')
        DependentVMs.any?.must_equal true
      end
    end
  end
end
