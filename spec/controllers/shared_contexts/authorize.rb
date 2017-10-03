RSpec.shared_context 'authorize' do
  let(:tenant) { create(:tenant) }
  let(:auth_headers) do
    {
      'Authorization' => tenant.api_key
    }
  end

  before do
    @request.env.merge!(auth_headers)
  end
end
