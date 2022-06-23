require 'rails_helper'

RSpec.describe 'Writers', type: :system do
  describe '#index' do
    it 'shows writers' do
      create(:writer, name: 'Alice Adams')

      visit writers_path
      expect(page).to have_content 'Alice Adams'
    end
  end

  describe '#new #create' do
    it 'creates a writer' do
      visit new_writer_path
      fill_in 'writer_name', with: 'Bob Brown'
      expect do
        click_button 'Save'
        expect(page).to have_content 'Writer was successfully created.'
      end.to change(Writer, :count).by(1)
      expect(page).to have_current_path writer_path(Writer.last)
      expect(page).to have_content 'Bob Brown'
    end

    context 'with no name' do
      it 'dose not create a writer' do
        visit new_writer_path
        expect do
          click_button 'Save'
          expect(page).to have_content '1 error prohibited this writer from being saved:'
        end.not_to change(Writer, :count)
        expect(page).to have_content "Name can't be blank"
      end
    end
  end

  describe '#edit #update' do
    let(:writer) { create(:writer, name: 'Carol   Campbell') }

    it 'updates the writer' do
      visit edit_writer_path(writer)
      fill_in 'writer_name', with: 'Carol Campbell'
      expect do
        click_button 'Save'
        expect(page).to have_content 'Writer was successfully updated.'
      end.to change { writer.reload.name }.from('Carol   Campbell').to('Carol Campbell')
      expect(page).to have_current_path writer_path(writer)
      expect(page).to have_content 'Carol Campbell'
    end

    context 'with no name' do
      it 'dose not update the writer' do
        visit edit_writer_path(writer)
        fill_in 'writer_name', with: ''
        expect do
          click_button 'Save'
          expect(page).to have_content '1 error prohibited this writer from being saved:'
        end.not_to(change { writer.reload.name })
        expect(page).to have_content "Name can't be blank"
      end
    end
  end

  describe '#destroy' do
    it 'destroys the writer' do
      create(:writer)

      visit writers_path
      expect do
        click_button 'Destroy'
        page.accept_confirm
        expect(page).to have_content 'Writer was successfully destroyed.'
      end.to change(Writer, :count).by(-1)
      expect(page).to have_current_path writers_path
    end
  end
end
