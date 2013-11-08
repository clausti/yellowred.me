YellowRed.profile_button_responses = {
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
			}, 
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
					profile_id: profileId,
					prefer: true
				}
			},
			success: function(res) {
				console.log("successfully maybed");
				YellowRed.maybe_profiles.fetch();
				YellowRed.nope.fetch();
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
				YellowRed.maybe_profiles.fetch();
				YellowRed.nope.fetch();
			}
		});
	}
};
