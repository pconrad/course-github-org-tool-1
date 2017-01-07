describe User do

  before(:each) { @user = FactoryGirl.create(:user,
    name: 'Test User',
    username: 'testuser'
  ) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:username) }

  it "#name returns a string" do
    expect(@user.name).to match 'Test User'
  end

  it "#username returns a string" do
    expect(@user.username).to match 'testuser'
  end

end
