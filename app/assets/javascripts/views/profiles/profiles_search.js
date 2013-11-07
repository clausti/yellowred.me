YellowRed.Views.ProfilesSearch = Backbone.View.extend({
	
	initialize: function () {
		this.collection = YellowRed.searched_profiles;
		this.listenTo( this.collection, 
									 "add remove reset",
								   this.render)
	},

  template: JST['profiles/search'],
	profileCard: JST['profiles/card'],
	
	render: function() {
		var searchForm = this.template();
		var resultsBox = $("<div class='search-results'>");
		
		this.collection.each( function (profile) {
			resultsBox.append(this.profileCard({
				profile: profile
			})
		});
		
		this.$el.html(searchForm).append(resultsBox);
		return this
	}

});