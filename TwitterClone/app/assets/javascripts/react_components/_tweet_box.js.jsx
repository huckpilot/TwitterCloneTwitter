var TweetBox = React.createClass({
  getInitialState: function() {
    serverTweets = JSON.parse(this.props.tweets)
    serverTweets = {tweets: serverTweets}
    return serverTweets
  },

  render: function() {
    return (
      <div className="tweets">
        <TweetsList tweets={this.state.tweets} />
      </div>
    );
  }
});

var TweetsList = React.createClass({
  render: function() {
    var tweetNodes = this.props.tweets.map(function(tweet) {
      return <Tweet content={tweet.content} />
    });
    return (
      <div className="tweets-list">
        {tweetNodes}
      </div>
    );
  }
});

var Tweet = React.createClass({
  render: function () {
    return (
      <p>{ this.props.content }</p>
    )
  }    
})

