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

#import "ThumbsViewController.h"
#import "ThumbsDataSource.h"

// UI
#import "Three20UI/TTNavigator.h"
#import "Three20UI/TTThumbsTableViewCell.h"
#import "Three20UI/TTPhoto.h"
#import "Three20UI/TTPhotoSource.h"
#import "Three20UI/TTPhotoViewController.h"
#import "Three20UI/UIViewAdditions.h"

// UINavigator
#import "Three20UINavigator/TTGlobalNavigatorMetrics.h"

// UICommon
#import "Three20UICommon/TTGlobalUICommon.h"
#import "Three20UICommon/UIViewControllerAdditions.h"

// Style
#import "Three20Style/TTGlobalStyle.h"
#import "Three20Style/TTStyleSheet.h"

// Core
#import "Three20Core/TTGlobalCoreLocale.h"
#import "Three20Core/TTGlobalCoreRects.h"
#import "Three20Core/TTCorePreprocessorMacros.h"

static CGFloat kThumbnailRowHeight = 225 + 12;


@implementation ThumbsViewController

- (void)updateTableLayout {
    [super updateTableLayout];
}

- (void)loadView {
  [super loadView];

  self.tableView.rowHeight = kThumbnailRowHeight;
  self.tableView.autoresizingMask =
  UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  self.tableView.backgroundColor = TTSTYLEVAR(backgroundColor);
  self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self updateTableLayout];
}


- (id<TTTableViewDataSource>)createDataSource {
  return [[[ThumbsDataSource alloc] initWithPhotoSource:_photoSource delegate:self] autorelease];
}

@end
