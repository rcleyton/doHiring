# typed: false
# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  EXPRESSION = /\A[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}\z/

  def validate_each(record, attr, value)
    return true if value.blank? || value.match?(EXPRESSION)

    record.errors[attr] << (options[:message] || 'deve ser um email válido')
  end
end
