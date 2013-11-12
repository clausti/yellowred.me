YellowRed.profile_button_responses = {
	starProfile: function(event) {
    var that = this
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
        debugger
			}, 
		});
	},
  
  unStarProfile: function(event) {
    var unStarButton = $(event.currentTarget)
		var profileId = unStarButton.attr("data-id");
		console.log("you clicked to unstar profile " + profileId);
		$.ajax({
			url: "stars/" + profileId,
			type: "delete",
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
        
        var profileId = res.id
        $(".maybe[data-id='" + profileId + "']").toggleClass("unmaybe", true);
        $(".unmaybe[data-id='" + profileId + "']").toggleClass("maybe", false);
        $(".unmaybe[data-id='" + profileId + "']").text("unMaybe");
        
        $(".unnope[data-id='" + profileId + "']").toggleClass("nope", true);
        $(".nope[data-id='" + profileId + "']").toggleClass("unnope", false);
        $(".nope[data-id='" + profileId + "']").text("Nope");
			}
		});
	},
  
  unMaybeProfile: function(event) {
    var unMaybeButton = $(event.currentTarget)
		var profileId = unMaybeButton.attr("data-id");
		console.log("you clicked to unmaybe profile " + profileId);
		$.ajax({
			url: "maybes/" + profileId,
			type: "delete",
			success: function(res) {
				console.log("successfully unmaybed");
        var profileId = res
        $(".unmaybe[data-id='" + profileId + "']").toggleClass("maybe", true);
        $(".maybe[data-id='" + profileId + "']").toggleClass("unmaybe", false);
        $(".maybe[data-id='" + profileId + "']").text("Maybe");
			}, 
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
				YellowRed.nope_profiles.fetch();
        YellowRed.searched_profiles.fetch();
        
        var profileId = res.id
        $(".nope[data-id='" + profileId + "']").toggleClass("unnope", true);
        $(".unnope[data-id='" + profileId + "']").toggleClass("nope", false);
        $(".unnope[data-id='" + profileId + "']").text("unNope");
        
        $(".unmaybe[data-id='" + profileId + "']").toggleClass("maybe", true);
        $(".maybe[data-id='" + profileId + "']").toggleClass("unmaybe", false);
        $(".maybe[data-id='" + profileId + "']").text("Maybe");
			}
		});
	},
  
  unNopeProfile: function(event) {
    var unMaybeButton = $(event.currentTarget)
		var profileId = unMaybeButton.attr("data-id");
		console.log("you clicked to unnope profile " + profileId);
		$.ajax({
			url: "maybes/" + profileId,
			type: "delete",
			success: function(res) {
				console.log("successfully unnoped");
        var profileId = res
        $(".unnope[data-id='" + profileId + "']").toggleClass("nope", true);
        $(".nope[data-id='" + profileId + "']").toggleClass("unnope", false);
        $(".nope[data-id='" + profileId + "']").text("Nope");
			}, 
		});
  },
  
};
