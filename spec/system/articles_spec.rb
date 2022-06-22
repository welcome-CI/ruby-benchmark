require 'rails_helper'

RSpec.describe 'Articles', type: :system do
  describe '#index' do
    it 'shows articles' do
      create(:article, title: 'Hello world!')

      visit articles_path
      expect(page).to have_content 'Hello world!'
    end
  end

  describe '#new #create' do
    it 'creates an article' do
      visit new_article_path
      fill_in 'article_title', with: 'Hello rails!'
      expect do
        click_button 'Save'
        expect(page).to have_content 'Article was successfully created.'
      end.to change(Article, :count).by(1)
      expect(page).to have_current_path article_path(Article.last)
      expect(page).to have_content 'Hello rails!'
    end

    context 'with no title' do
      it 'dose not create an article' do
        visit new_article_path
        expect do
          click_button 'Save'
          expect(page).to have_content '1 error prohibited this article from being saved:'
        end.not_to change(Article, :count)
        expect(page).to have_content "Title can't be blank"
      end
    end
  end

  describe '#edit #update' do
    let(:article) { create(:article, title: 'Hello ruby!') }

    it 'updates the article' do
      visit edit_article_path(article)
      fill_in 'article_title', with: 'Hi ruby!'
      expect do
        click_button 'Save'
        expect(page).to have_content 'Article was successfully updated.'
      end.to change { article.reload.title }.from('Hello ruby!').to('Hi ruby!')
      expect(page).to have_current_path article_path(article)
      expect(page).to have_content 'Hi ruby!'
    end

    context 'with no title' do
      it 'dose not update the article' do
        visit edit_article_path(article)
        fill_in 'article_title', with: ''
        expect do
          click_button 'Save'
          expect(page).to have_content '1 error prohibited this article from being saved:'
        end.not_to(change { article.reload.title })
        expect(page).to have_content "Title can't be blank"
      end
    end
  end

  describe '#destroy' do
    it 'destroys the article' do
      create(:article)

      visit articles_path
      expect do
        click_button 'Destroy'
        page.accept_confirm
        expect(page).to have_content 'Article was successfully destroyed.'
      end.to change(Article, :count).by(-1)
      expect(page).to have_current_path articles_path
    end
  end
end
