# typed: false
# frozen_string_literal: true

require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  setup do
    @applicant = Applicant.new
  end

  describe 'applicant' do
    it 'must be valid' do
      @applicant.email = 'applicant@applicant.com'
      @applicant.password = 'password'
      assert @applicant.save
    end
  end

  describe 'email' do
    it 'must have an email' do
      @applicant.email = nil
      assert_not @applicant.save
    end

    it 'email must be uniq' do
      other_applicant = Applicant.new(email: @applicant.email, password: 'password', password_confirmation: 'password')
      assert_not other_applicant.save
    end

    it 'emai mut be valid' do
      @applicant.email = 'applicant@applicant'
      assert_not @applicant.save
    end
  end

  describe 'password' do
    it 'password cannot be blank' do
      @applicant.password = nil
      assert_not @applicant.save
    end

    it 'minimum 8 characters' do
      @applicant.password = 'pwd123'
      @applicant.password_confirmation = 'pwd123'
      assert_not @applicant.valid?
      assert_operator @applicant.password.length, :<, 8
    end

    it 'passwords must be the same' do
      @applicant.password = 'password'
      @applicant.password_confirmation = 'other_password'
      assert_not @applicant.save
    end
  end
end
