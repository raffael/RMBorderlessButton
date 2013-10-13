//
//  RMBorderlessButton.m
//  Chat Heads
//
//  Created by Raffael Hannemann on 11.08.13.
//  Copyright (c) 2013 raffael.me. All rights reserved.
//

#import "RMBorderlessButton.h"

@implementation RMBorderlessButton

- (id)init
{
    self = [super init];
    if (self) {
		self.font = [NSFont fontWithName: @"Helvetica-Bold" size: self.fontSize];
        [self setUp];
    }
    return self;
}

- (id) initWithFrame:(NSRect)frameRect {
	self = [super initWithFrame:frameRect];
	if (self)
		self.font = [NSFont fontWithName: @"Helvetica-Bold" size: self.fontSize];
		[self setUp];
	return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self)
		self.font = [NSFont fontWithName: @"Helvetica-Bold" size: self.fontSize];
		[self setUp];
	return self;
}

- (void) setTitle:(NSString *)aString {
	[super setTitle:aString];
	if (self.fontSize==0) self.fontSize = 12;
	
	if (!_color) {
		self.color = [NSColor colorWithCalibratedRed:59.0/255.0 green:89.0/255.0 blue:152.0/255.0 alpha:1.0];
	}
	NSColor *color = _color;

	NSMutableAttributedString *colorTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];

	[colorTitle addAttribute:NSFontAttributeName
					   value:self.font
					   range:NSMakeRange(0, [colorTitle length])];
    [colorTitle addAttribute:NSForegroundColorAttributeName
                       value:color
                       range:NSMakeRange(0, [colorTitle length])];
    [self setAttributedTitle:colorTitle];
}

- (void) setUp {
	_dimWhileClicked = YES;
	[self setTitle:self.title];
	[self setButtonType:NSMomentaryChangeButton];
	[self setBordered:NO];
}

- (void) mouseDown:(NSEvent *)theEvent {
	if (self.isEnabled) {
		NSColor *dimmedColor = [self dimmedColor];
		_tempColor = _color;
		self.color = dimmedColor;
		[self setTitle:self.title];
	}
	[super mouseDown:theEvent];
	[self mouseUp:theEvent]; // see http://www.cocoabuilder.com/archive/cocoa/141135-nsbutton-up-and-down.html#141160
}

- (NSColor *) dimmedColor {
	CGFloat r, g, b, a;
	r = _color.redComponent;
	g = _color.greenComponent;
	b = _color.blueComponent;
	a = _color.alphaComponent;
	return [NSColor colorWithCalibratedRed:MAX(r - 0.2, 0.0)
						   green:MAX(g - 0.2, 0.0)
							blue:MAX(b - 0.2, 0.0)
						   alpha:a];
}

- (void) mouseUp:(NSEvent *)theEvent {
	if (self.isEnabled) {
		self.color = _tempColor;
		[self setTitle:self.title];
	}
	[super mouseUp:theEvent];
}

- (void)resetCursorRects {
	NSCursor *cursor = (self.cursor) ? self.cursor : [NSCursor pointingHandCursor];
    if (cursor) {
        [self addCursorRect:[self bounds] cursor: cursor];
    } else {
        [super resetCursorRects];
    }
}

@end
