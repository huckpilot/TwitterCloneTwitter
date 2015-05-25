var TweetBox = React.createClass({
  getInitialState: function() {
    serverTweets = JSON.parse(this.props.tweets)
    serverTweets = {tweets: serverTweets}
    return serverTweets
  },

  handleTweetSubmit: function(formData, action) {
    $.ajax({
      data: formData,
      url: action,
      type: "POST",
      success: function(data) {
        this.setState({tweets: data})
      }.bind(this)
    });
  },

  render: function() {
    return (
      <div className="tweets">
        <TweetsList tweets={this.state.tweets.tweets} />
        <TweetsForm form={this.state.tweets.form} onTweetSubmit={this.handleTweetSubmit} />
      </div>
    );
  }
});

var TweetsList = React.createClass({
  render: function() {
    var tweetNodes = this.props.tweets.map(function(tweet) {
      return <Tweet tweet={tweet} />
    });
    return (
      <div className="tweets-list">
        {tweetNodes}
      </div>
    );
  }
});

var TweetsForm = React.createClass({
  handleSubmit: function(event){
    event.preventDefault();
    var tweet = this.refs.content.getDOMNode().value.trim()

    var formData = $(this.refs.form.getDOMNode()).serialize()
    this.props.onTweetSubmit(formData, this.props.form.action);
    this.refs.content.getDOMNode().value = "";
  },

  render: function() {
    return (
      <form ref="form" className="tweet-form" action={this.props.form.action} method="post" onSubmit={this.handleSubmit}>
        <input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } />
        <input ref="content" name="tweet[content]" placeholder="tweet something" />
        <button>tweet</button>
      </form>
    );
  }
});

var Tweet = React.createClass({
  render: function () {
    return (
      <p>{ this.props.tweet.content }</p>
    )
  }
});

