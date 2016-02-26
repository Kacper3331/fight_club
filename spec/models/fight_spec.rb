describe Fight, type: :model do
  let(:first_fighter) { FactoryGirl.create(:fighter) }
  let(:second_fighter) { FactoryGirl.create(:second_fighter) }

  it { is_expected.to respond_to(:first_fighter_id) }
  it { is_expected.to respond_to(:second_fighter_id) }

  it { is_expected.to validate_presence_of(:first_fighter_id) }
  it { is_expected.to validate_presence_of(:second_fighter_id) }
end
