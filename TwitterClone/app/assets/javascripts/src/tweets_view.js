var TweetsList = React.createClass({
	getInitialState: function() {
		return {
			tweets: []
		}
	},
	componentDidMount: function() {
		$.get(this.props.source, function(result) {
			var Tweets = result;
			if (this.isMounted()) {
				this.setState({
					tweets: result
				})
			}
		})
	},
	render: function() {
		debugger
		return (this.state.tweets)
	}
});

React.render(
	<TweetsList />,
	document.getElementById('tweets')
);
