require 'spec_helper'

describe Tweet do 
  it 'should be invalid without an author/user' do
    tweet = Tweet.create
    expect(tweet).to be_invalid
    expect(tweet.errors[:user_id]).to eq ["can't be blank"]
  end
  it 'should be invalid with blank content' do 
    tweet = Tweet.create
    expect(tweet).to be_invalid
    expect(tweet.errors[:content]).to eq ["can't be blank"]
  end
  it 'should not have content longer than  140 characters' do 
    tweet = Tweet.create(content: "a" * 141)
    expect(tweet).to be_invalid
    expect(tweet.errors[:content]).to eq ["is too long (maximum is 140 characters)"]
  end
end