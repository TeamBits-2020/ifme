require 'spec_helper'

RSpec.describe ExternalResource, type: :model do
  subject(:external_resource) { FactoryBot.build(:external_resource) }

  it ' has a valid factory' do
    expect(external_resource.validate!).to eq(true)
  end

  it { is_expected.to validate_presence_of(:name) }

  it { is_expected.to validate_presence_of(:link) }

  it { is_expected.to validate_uniqueness_of(:link) }

  it { is_expected.to validate_presence_of(:languages) }
end
