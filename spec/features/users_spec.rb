require'spec_helper'

feature 'Users' do
  scenario 'add a new user' do
    user = User.create(name: 'John', email: 'john@example.com')
    
    visit root_path
    
    click_link "new"
    
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    
    click_button 'submit'
    
    expect(current_path).to eq users_path
  end
end