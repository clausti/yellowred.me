YellowRed.instantiateCollections = function() {
  YellowRed.messages             = new YellowRed.Collections.AllMessages();
	YellowRed.all_profiles         = new YellowRed.Collections.AllProfiles();
  YellowRed.searched_profiles    = new YellowRed.Collections.SearchedProfiles();
	YellowRed.maybe_profiles       = new YellowRed.Collections.MaybeProfiles();
	YellowRed.nope_profiles        = new YellowRed.Collections.NopeProfiles();
	YellowRed.starred_profiles     = new YellowRed.Collections.StarredProfiles();
	YellowRed.starring_profiles    = new YellowRed.Collections.StarringProfiles();
}
