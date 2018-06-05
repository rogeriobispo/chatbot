module FaqModule
  class CreateLink
    def initialize(params)
      @company = Company.last
      @url = params[:'url']
      @hashtags = params[:'hashtags']
    end

    def call
      return 'Hashtag orbrigatória' if @hashtags == nil
      Link.transaction do
        link = Link.create(company: @company, url: @url)
        @hashtags.split(/[\s,]+/).each do |hashtag|
          link.hashtags << Hashtag.create(name: hashtag)
        end
      end
      'Criado com sucesso' end
  end
end
