require 'rails_helper'

RSpec.describe 'Articles::Writers', type: :system do
  describe '#edit #update' do
    let(:article) { create(:article) }

    it 'associates a writer with the article' do
      alice = create(:writer, name: 'alice')

      visit edit_article_writers_path(article)
      fill_in 'Writer ID', with: alice.id
      expect do
        click_button 'Save'
        expect(page).to have_content 'Article was successfully updated.'
      end.to change(ArticleWriter, :count).by(1)
      expect(page).to have_current_path article_path(article)
      expect(page).to have_content 'alice'
    end

    it 'associates writers with the article' do
      bob = create(:writer, name: 'bob')
      carol = create(:writer, name: 'carol')

      visit edit_article_writers_path(article)
      fill_in 'Writer ID', with: bob.id
      click_button 'Add input field'
      writer_id_inputs = all(id: /article_articles_writers_attributes_\d+_writer_id/)
      expect(writer_id_inputs.count).to eq 2
      writer_id_inputs[1].fill_in with: carol.id
      expect do
        click_button 'Save'
        expect(page).to have_content 'Article was successfully updated.'
      end.to change(ArticleWriter, :count).by(2)
      expect(page).to have_current_path article_path(article)
      expect(page).to have_content 'bob'
      expect(page).to have_content 'carol'
    end

    context 'with non-existent writer id' do
      it 'dose not associate a writer with the article' do
        visit edit_article_writers_path(article)
        fill_in 'Writer ID', with: '7328745381325458'
        expect do
          click_button 'Save'
          expect(page).to have_content '1 error prohibited this article from being saved:'
        end.not_to change(ArticleWriter, :count)
        expect(page).to have_content 'Articles writers writer must exist'
        writer_id_inputs = all(id: /article_articles_writers_attributes_\d+_writer_id/)
        expect(writer_id_inputs.count).to eq 2
      end
    end
  end
end
