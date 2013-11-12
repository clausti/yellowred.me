YellowRed.profile_button_responses = {
	starProfile: function(event) {
    var that = this
    console.log("star")
    var starButton = $(event.currentTarget)
		var profileId = starButton.attr("data-id");
		console.log("you clicked to star profile " + profileId);
		$.ajax({
			url: "stars",
			type: "post",
			data: { 
				profile_id: profileId
			},
			success: function(res) {
				console.log("successfully starred");
        var profileId = res.id
        $(".star[data-id='" + profileId + "']").toggleClass("unstar", true);
        $(".unstar[data-id='" + profileId + "']").toggleClass("star", false);
        $(".unstar[data-id='" + profileId + "']").text("unStar");
			}, 
		});
	},
  
  unStarProfile: function(event) {
    var that = this
    console.log("unstar")
    var unStarButton = $(event.currentTarget)
		var profileId = unStarButton.attr("data-id");
		console.log("you clicked to unstar profile " + profileId);
		$.ajax({
			url: "stars/" + profileId,
			type: "delete",
			data: { 
				profile_id: profileId
			},
			success: function(res) {
				console.log("successfully unstarred");
        var profileId = res
        $(".unstar[data-id='" + profileId + "']").toggleClass("star", true);
        $(".star[data-id='" + profileId + "']").toggleClass("unstar", false);
        $(".star[data-id='" + profileId + "']").text("Star");
			}, 
		});
  },

	maybeProfile: function(event) {
    console.log("maybe")
    
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
				YellowRed.nope_profiles.fetch();
			}
		});
	},
  
  unMaybeProfile: function(event) {
    
  },

	nopeProfile: function(event) {
    console.log("nope")
    
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
				YellowRed.nope_profiles.fetch();
        YellowRed.searched_profiles.fetch();
			}
		});
	},
  
  unNopeProfile: function(event) {
    
  },
  
};
