module Services
  class DetailFinder
    
    def initialize(params)
      @params = params.dup
    end
    
    def self.find_dataset(params)
      new(params).find_dataset
    end
    
    def find_dataset(chain = Detail.all)
      chain = chain.where(Detail[:name].matches("%#{@params[:name]}%")) if @params[:name].present?
      chain = chain.where(Detail[:price_from].gteq(@params[:price_from])) if @params[:price_from].present?
      chain = chain.where(Detail[:price_to].lteq(@params[:price_to])) if @params[:price_to].present?
      chain = chain.where(Detail[:hours_from].gteq(@params[:hours_from])) if @params[:hours_from].present?
      chain = chain.where(Detail[:hours_to].lteq(@params[:hours_to])) if @params[:hours_to].present? 
      chain           
    end
  end
end
