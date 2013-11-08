YellowRed.Views.ProfileDetail = Backbone.View.extend(_.extend({
	// initialize with a model

  template: JST['profiles/detail'],
	
	events: {
		"click .star": "starProfile",
		"click .maybe": "maybeProfile",
		"click .nope": "nopeProfile",
	},
	
	render: function() {
		var renderedContent = this.template({
			profile: this.model
		})
		this.$el.html(renderedContent);
		this.$el.attr("id", "profile-detail");
		this.$el.attr("class", "round-corners shadow");
		return this
	}

}, YellowRed.profile_button_responses));
