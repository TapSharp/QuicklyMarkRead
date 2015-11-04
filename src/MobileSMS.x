#import "MobileSMS.h"

%hook CKConversationListCell

- (CKConversationListCell *) initWithStyle:(NSInteger)arg1 reuseIdentifier:(id)arg2 {
	CKConversationListCell* cell = %orig;

	UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self
																					  	  action:@selector(handleLongPressEvent:)];
	gesture.delegate = self;
	gesture.minimumPressDuration = 0.5;

	[self addGestureRecognizer:gesture];
	[gesture release];

	return cell;
}

%new
-(void)handleLongPressEvent:(UILongPressGestureRecognizer *)gestureRecognizer {
	[[self conversation] markAllMessagesAsRead];
}

%end

%ctor {
	if (IS_IN_BUNDLE(@"com.apple.MobileSMS")) %init;
}