YellowRed.Views.ProfileDetail = Backbone.View.extend(_.extend({
	// initialize with a model
  
  initialize: function(options) {
    this.path = options.path;
		this.listenTo( this.model, 
										"change", 
										this.render)
  },

  detailCard: JST['profiles/detail'],
  editButton: JST['profiles/edit_button'],
  mnsMsgButtons: JST['profiles/buttons'],
	
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
    this.$el.find(".profile-photo").draggable({
        revert: true,
        stack: ".profile-photo",
        opacity: 0.35
    });
		return this
	},
  
  addButtons: function() {
		if (this.path == "profile") {
      this.$el.append(this.editButton({
        profile: this.model
      }));
		} else {
			this.$el.append(this.mnsMsgButtons({
        profile: this.model
      }));
		}
  },

}, YellowRed.profile_button_responses));
