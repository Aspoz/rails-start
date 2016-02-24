require 'rails_helper'

describe Constraints::Api do
  context 'matches?' do
    subject { api_constraint.matches?(request) }

    context 'true when version matches accept header' do
      let(:api_constraint) { described_class.new(version: 1) }
      let(:request) do
        double(host: 'api.twitch.dev', headers: { 'Accept' => 'application/vnd.twitch.v1' })
      end
      it { is_expected.to be true }
    end

    context 'true when version is default' do
      let(:api_constraint) { described_class.new(version: 2, default: true) }
      let(:request) { double(host: 'api.twitch.dev') }
      it { is_expected.to be true }
    end
  end
end
