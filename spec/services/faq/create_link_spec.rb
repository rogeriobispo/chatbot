require_relative './../../spec_helper.rb'

describe FaqModule::CreateLink do
  before do
    @company = create(:company)
    @link = 'faker.link.com'
    @hashtags = "#{FFaker::Lorem.word}, #{FFaker::Lorem.word}"
  end

  describe '#call' do
    it 'Without hashtag params, will receive a error' do
      @create_link = FaqModule::CreateLink.new('link': @link)

      response = @create_link.call()
      expect(response).to match('Hashtag orbrigatória')
    end

    it 'With valid params, receive success message' do
      @create_link = FaqModule::CreateLink.new('link': @link, 'hashtags': @hashtags)

      response = @create_link.call()
      expect(response).to match('Criado com sucesso')
    end

    it 'With valid params, find question and anwser in database' do
      @create_service = FaqModule::CreateService.new('question-original': @question, 'answer-original': @answer, 'hashtags-original': @hashtags)

      @create_service.call()
      expect(Faq.last.question).to match(@question)
      expect(Faq.last.answer).to match(@answer)
    end

    it 'With valid params, hashtags are created' do
      @create_service = FaqModule::CreateService.new('question-original': @question, 'answer-original': @answer, 'hashtags-original': @hashtags)

      @create_service.call
      expect(@hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
      expect(@hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
    end
  end
end
