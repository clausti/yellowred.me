YellowRed.Views.ProfileDetail = Backbone.View.extend({
	// initialize with a model

  template: JST['profiles/detail'],
	
	render: function() {
		var renderedContent = this.template({
			profile: this.model
		})
		this.$el.html(renderedContent);
		this.$el.attr("id", "profile-detail");
		this.$el.attr("class", "round-corners shadow");
		return this
	}

});
