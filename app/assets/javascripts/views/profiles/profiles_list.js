YellowRed.Views.ProfilesList = Backbone.View.extend({
	// initialize with a collection
	
	initialize: function() {
		this.listenTo( this.collection, 
										"add remove change sync reset", 
										this.render)
	},
	
  template: JST['profiles/card'],
	
	events: {
		"click .star": "starProfile",
		"click .maybe": "maybeProfile",
		"click .nope": "nopeProfile",
		"click .profile-card": "linkProfile",
	},
	
	render: function() {
		var that = this
		this.$el.html('');
		this.collection.each( function (profile) {
			that.$el.append(that.template({
				profile: profile
			}))
		});
		return this;
	},
	
	linkProfile: function(event) {
		var username = $(event.currentTarget).attr("data-username");
		YellowRed.appRouter.navigate(username, {trigger: true});
	},
	
	starProfile: function(event) {
		var profileId = $(event.currentTarget).attr("data-id");
		console.log("you clicked to star profile " + profileId);
		$.ajax({
			url: "stars",
			type: "post",
			data: { 
				profile_id: profileId
			},
			success: function(res) {
				console.log("successfully starred");
				YellowRed.appRouter.navigate('');	
			}, 
			error: function() {
				
			}
		});
	},
	
	maybeProfile: function(event) {
		var profileId = $(event.currentTarget).attr("data-id");
		console.log("you clicked to maybe profile " + profileId);
		$.ajax({
			url: "maybes",
			type: "post",
			data: { 
				maybe: { 
					profile_id: profileId
				}
			},
			success: function(res) {
				console.log("successfully maybed");
				YellowRed.appRouter.navigate('');	
			}, 
			error: function() {
				
			}
		});
	},
	
	nopeProfile: function(event) {
		var profileId = $(event.currentTarget).attr("data-id");
		console.log("you clicked to nope profile " + profileId);
		$.ajax({
			url: "maybes",
			type: "post",
			data: { 
				maybe: { 
					profile_id: profileId,
					prefer: false
				}
			},
			success: function(res) {
				console.log("successfully noped");
				YellowRed.appRouter.navigate('');	
			}, 
			error: function() {
				
			}
		});
	},

});