YellowRed.Views.NewMessage = Backbone.View.extend({

  formBodyTemplate: JST['messages/new_body'],
  inputRecip: JST['messages/new_recip'],
  recipPhoto: JST['messages/new_recip_photo'],
  profileRecip: JST['messages/to_profile'],
  claustiRecip: JST['messages/to_clausti'],
  cancelFromMessages: JST['messages/messages_cancel'],
  cancelFromProfile: JST['messages/profile_cancel'],
  cancelFromClausti: JST['messages/clausti_cancel'],
  
  events: {
    "submit form": "sendMessage",
    "blur #message_recipient": "checkForUser"
  },
	
	render: function() {
		var messageForm = this.formBodyTemplate();
    this.$el.html(messageForm);
    var profileId = $('#new-message').attr('data-id')
    
    if ( profileId == 'messages' ) {
      this.$el.find("#new-message-form").prepend(this.inputRecip());
      this.$el.find("#new-message-form").append(this.cancelFromMessages());
      return this;
    } else if ( profileId == 'clausti') {
      this.$el.find("#new-message-form").prepend(this.claustiRecip());
      this.$el.find("#new-message-form").append(this.cancelFromClausti());
      return this;
    } else {
      this.$el.find("#new-message-form").prepend(this.profileRecip());
      this.$el.find("#new-message-form").append(this.cancelFromProfile({
        profileId: profileId
      }));
  		return this;
    }
	},
  
  checkForUser: function(event) {
    var that = this;
    var recipient = $(event.currentTarget).val();
    $.ajax({
      url: recipient,
      success: function(res) {
        $("#username-errors").html('');
        $("#message-recip-photo").html(that.recipPhoto({ photoUrl: res.photo_thumb_url }));
        $("#message-recip-photo").attr("data-id", res.id)
        $("#message-recip-photo").draggable({
          revert: true,
          revertDuration: 300,
          opacity: 0.35,
          stack: "#message-recip-photo"
        })
      },
      error: function() {
        $("#username-errors").html("Username not found!");
        $("#message-recip-photo").html('');
      }
    });
  },
  
  sendMessage: function(event) {
    event.preventDefault();
    var msgData = $(event.currentTarget).serializeJSON();
    $.ajax({
      url: "messages",
      data: msgData,
      type: 'post',
      success: function(res) {
       var message = new YellowRed.Models.Message(); 
       YellowRed.messages.add(message);
       console.log('you sent a message!');
      },
      error: function(req, err) {
        console.log(err);
      }
    });
    window.location = "/#/messages";
  },

});