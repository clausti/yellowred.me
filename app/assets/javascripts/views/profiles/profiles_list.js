YellowRed.Views.ProfilesList = Backbone.View.extend({
	// call new with a collection specified
	
  template: JST['profiles/card']
	
	render: function() {
		this.$el.html('');
		this.collection.each( function (profile) {
			this.$el.append(this.profileCard({
				profile: profile
			})
		});
	}

});