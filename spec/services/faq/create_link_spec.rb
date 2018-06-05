require_relative './../../spec_helper.rb'

describe FaqModule::CreateLink do
  before do
    @company = create(:company)
    @url = 'faker.link.com'
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do
    it 'Without hashtag params, will receive a error' do
      @create_link = FaqModule::CreateLink.new('link': @url)

      response = @create_link.call()
      expect(response).to match('Hashtag orbrigatória')
    end

    it 'With valid params, receive success message' do
      @create_link = FaqModule::CreateLink.new({ 'url': @url, 'hashtags': @hashtags })

      response = @create_link.call()
      expect(response).to match('Criado com sucesso')
    end
  end
end
