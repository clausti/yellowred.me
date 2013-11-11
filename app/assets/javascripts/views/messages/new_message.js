YellowRed.Views.NewMessage = Backbone.View.extend({

  formBodyTemplate: JST['messages/new_body'],
  inputRecip: JST['messages/new_recip'],
  cancelFromMessages: JST['messages/messages_cancel'],
  profileRecip: JST['messages/from_profile'],
  cancelFromProfile: JST['messages/profile_cancel'],
  
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
    } else {
      this.$el.find("#new-message-form").prepend(this.profileRecip());
      this.$el.find("#new-message-form").append(this.cancelFromProfile({
        profileId: profileId
      }));
  		return this;
    }
	},
  
  checkForUser: function(event) {
    var recipient = $(event.currentTarget).val();
    $.ajax({
      url: recipient,
      success: function() {
        $("#username-errors").html('');
      },
      error: function() {
        $("#username-errors").html("Username not found!");
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
    YellowRed.appRouter.navigate('messages', {trigger:true});
  },

});