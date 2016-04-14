require "spec_helper"

describe Facter::Util::Fact do
  before {
    Facter.clear
  }

  describe 'RedHat' do
    context 'returns true when pkg_updates fact has updates' do
      before do
        Facter.fact(:osfamily).stubs(:value).returns("RedHat")
        Facter.fact(:pkg_updates).stubs(:value).returns({"NetworkManager.x86_64" => {"current"=>"1.0.6-27.el7", "update"=>"1.0.6-29.el7_2"}})
        Facter::Util::Resolution.stubs(:exec)
      end
      let(:facts) { {:osfamily => 'RedHat'} }
      it do
        expect(Facter.value(:pkg_updates_available)).to eq(true)
      end
    end

    context 'returns true when pkg_updates fact has updates' do
      before do
        Facter.fact(:osfamily).stubs(:value).returns("RedHat")
        Facter.fact(:pkg_updates).stubs(:value).returns(nil)
        Facter::Util::Resolution.stubs(:exec)
      end
      let(:facts) { {:osfamily => 'RedHat'} }
      it do
        expect(Facter.value(:pkg_updates_available)).to eq(false)
      end
    end

  end
end
