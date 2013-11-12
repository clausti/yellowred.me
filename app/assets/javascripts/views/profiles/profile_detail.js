YellowRed.Views.ProfileDetail = Backbone.View.extend(_.extend({
	// initialize with a model
  
  initialize: function(options) {
    this.path = options.username;
  },

  detailCard: JST['profiles/detail'],
  editButton: JST['profiles/edit_button'],
  maybeNopeStarMsgButtons: JST['profiles/mns_buttons'],
	
	events: {
		"click .star": "starProfile",
		"click .maybe": "maybeProfile",
		"click .nope": "nopeProfile",
		"click .unstar": "unStarProfile",
		"click .unmaybe": "unMaybeProfile",
		"click .unnope": "unNopeProfile",
	},
	
	render: function() {
		var detailCard = this.detailCard({
			profile: this.model
		})
    this.$el.html("<h3 id='profile-username'>" + this.model.escape('username') + "</h3>");
    this.addButtons();
		this.$el.append(detailCard);
		return this
	},
  
  addButtons: function() {
		if (this.path == "profile") {
      this.$el.append(this.editButton({
        profile: this.model
      }));
		} else {
			this.$el.append(this.maybeNopeStarMsgButtons({
        profile: this.model,
        maybed: this.model.get('maybed'),
        noped: this.model.get('noped'),
        starred: this.model.get('starred'),
      }));
		}
  },

}, YellowRed.profile_button_responses));
