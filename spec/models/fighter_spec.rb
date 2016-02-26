describe Fighter, type: :model do
  let(:fighter) { FactoryGirl.create(:fighter) }

  it { is_expected.to respond_to :firstname }
  it { is_expected.to respond_to :lastname }
end
