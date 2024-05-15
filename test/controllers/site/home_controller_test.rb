# typed: false
# frozen_string_literal: true

require 'test_helper'

class Site::HomeControllerTest < ActionDispatch::IntegrationTest
  describe 'access home page' do
    it 'uses the site layout' do
      get root_url
      assert_template layout: 'layouts/site'
    end

    it 'must have a content' do
      get root_url

      paragraph = 'A doHiring é a plataforma ideal para conectar recrutadores e candidatos. ' \
                  'Com nossas ferramentas, você pode encontrar oportunidades de emprego que ' \
                  'correspondam às suas habilidades e experiências, ou encontrar os ' \
                  'melhores talentos para sua empresa.'

      assert_select 'h1', 'Bem-vindo ao doHiring'
      assert_select 'p', paragraph
      assert_select 'a', 'Quero contratar'
      assert_select 'a', 'Quero trabalhar'
    end
  end
end
