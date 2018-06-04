module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(params)
      results = self.where(nil).page(params[:page])
      params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end