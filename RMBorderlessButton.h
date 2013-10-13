//
//  RMBorderlessButton.h
//  Chat Heads
//
//  Created by Raffael Hannemann on 11.08.13.
//  Copyright (c) 2013 raffael.me. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RMBorderlessButtonCell.h"

@interface RMBorderlessButton : NSButton {
	NSColor *_tempColor;
}

@property (strong) RMBorderlessButtonCell *customCell;
@property (strong) NSCursor *cursor;
@property (strong) NSColor *color;
@property (assign) float fontSize;
@property (assign) BOOL dimWhileClicked;
@property (assign) BOOL pressed;
@property (strong) id representedObject;

@end
