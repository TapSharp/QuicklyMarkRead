#import "Common.h"

@interface CKConversation : NSObject
- (void)markAllMessagesAsRead;
@end

@interface CKConversationListCell : UITableViewCell<UIGestureRecognizerDelegate>
- (UITableView *)_tableView;
- (CKConversation *)conversation;
- (CKConversationListCell *)initWithStyle:(NSInteger)arg1 reuseIdentifier:(id)arg2;
@end