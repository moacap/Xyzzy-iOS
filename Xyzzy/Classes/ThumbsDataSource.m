//
// Copyright 2009-2011 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "ThumbsDataSource.h"

// UI
#import "Three20UI/TTPhotoSource.h"
#import "Three20UI/TTTableMoreButton.h"
#import "Three20UI/TTThumbsTableViewCell.h"

// UINavigator
#import "Three20UINavigator/TTGlobalNavigatorMetrics.h"

// Network
#import "Three20Network/TTGlobalNetwork.h"
#import "Three20Network/TTURLCache.h"

// Core
#import "Three20Core/TTGlobalCoreLocale.h"
#import "Three20Core/TTCorePreprocessorMacros.h"

static CGFloat kThumbSize = 164;
static CGFloat kThumbSpacing = 12;

@implementation ThumbsDataSource

- (NSInteger)columnCountForView:(UIView *)view {
  CGFloat width = view.bounds.size.width;
  return floorf((width - kThumbSpacing*2) / (kThumbSize+kThumbSpacing) + 0.1);
}

- (void)        tableView: (UITableView*)tableView
                     cell: (UITableViewCell*)cell
    willAppearAtIndexPath: (NSIndexPath*)indexPath {
  if ([cell isKindOfClass:[TTThumbsTableViewCell class]]) {
    TTThumbsTableViewCell* thumbsCell = (TTThumbsTableViewCell*)cell;
    thumbsCell.delegate = _delegate;
    thumbsCell.thumbSize = kThumbSize;
    thumbsCell.columnCount = [self columnCountForView:tableView];
  }
}

@end
