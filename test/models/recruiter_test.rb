# typed: false
# frozen_string_literal: true

require 'test_helper'

class RecruiterTest < ActiveSupport::TestCase
  setup do
    @recruiter = Recruiter.new
  end

  describe 'recruiter' do
    it 'must be valid' do
      @recruiter.email = 'recruiter@recruiter.com'
      @recruiter.password = 'password'
      assert @recruiter.valid?
    end
  end

  describe 'email' do
    it 'must have an email' do
      @recruiter.email = nil
      assert_not @recruiter.save
    end

    it 'must be uniq' do
      other_recruiter = Recruiter.new(email: @recruiter.email, password: 'password', password_confirmation: 'password')
      assert_not other_recruiter.save
    end

    it 'must be valid' do
      @recruiter.email = 'recruiter@recruiter'
      assert_not @recruiter.save
    end

    it 'must be downcase' do
      email = 'RECRUITER@RECRUITER.COM'
      @recruiter.email = email
      @recruiter.password = 'password'
      @recruiter.password_confirmation = 'password'
      assert @recruiter.save
      assert_equal email.downcase, @recruiter.email
    end
  end

  describe 'password' do
    it 'cannot be blank' do
      @recruiter.password = nil
      assert_not @recruiter.save
    end

    it 'minimum 8 characters' do
      @recruiter.password = 'pwd123'
      @recruiter.password_confirmation = 'pwd123'
      assert_not @recruiter.valid?
      assert_operator @recruiter.password.length, :<, 8
    end

    it 'must be the same' do
      @recruiter.password = 'password'
      @recruiter.password_confirmation = 'other_password'
      assert_not @recruiter.save
    end
  end
end
