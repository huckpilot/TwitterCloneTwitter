var TweetBox = React.createClass({
  getInitialState: function() {
    return JSON.parse(this.props.tweets)
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

  handleTweetDelete: function(formData, action) {
    $.ajax({
      data: formData,
      url: action,
      type: "DELETE",
      success: function(data) {
        this.setState({tweets: data})
      }.bind(this)
    });
  },

  render: function() {
    return (
      <div className="tweets">
        <TweetsList tweets={this.state.tweets} form={this.state.form} onTweetDelete={this.handleTweetDelete} />
        <TweetsForm form={this.state.form} onTweetSubmit={this.handleTweetSubmit} />
      </div>
    );
  }
});

var TweetsList = React.createClass({
  render: function() {
    var tweetNodes = this.props.tweets.map(function(tweet) {
      return <Tweet tweet={tweet} form={this.props.form} onTweetDelete={this.props.onTweetDelete} />
    }.bind(this));
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

var TweetDeleteForm = React.createClass({
  handleDelete: function(event) {
    event.preventDefault();
    var formData = $(this.refs.form.getDOMNode()).serialize()
    this.props.onTweetDelete(formData, this.refs.form.props.action);
  },

  render: function() {
    var path = "/tweets/" + this.props.tweet.id
    return (
      <form ref="form" action={path} method="post" onSubmit={this.handleDelete}>
        <input type="hidden" name={ this.props.form.csrf_param } value={ this.props.form.csrf_token } />
        <input type="hidden" name="_method" value="delete" />
        <button>delete</button>
      </form>
    );
  }
});

var Tweet = React.createClass({
  render: function () {
    return (
      <div>
        <p>{this.props.tweet.content}</p>
        <p>{this.props.tweet.created_at}</p>
        <TweetDeleteForm tweet={this.props.tweet} form={this.props.form} onTweetDelete={this.props.onTweetDelete} />
      </div>
    );
  }
});

