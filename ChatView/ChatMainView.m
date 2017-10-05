//
//  ChatMainView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatMainView.h"

@implementation ChatMainView {
    NSMutableArray *itemsArray;
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    [self drawDividerLine];
    itemsArray = [[NSMutableArray alloc] init];
    
    ChatMessageModel *model0 = [ChatMessageModel new];
    model0.messageText = @"Hello World";
    model0.isIncomeMessage = YES;
    [itemsArray addObject:model0];
    
    ChatMessageModel *model1 = [ChatMessageModel new];
    model1.messageText = @"Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World";
    model1.isIncomeMessage = NO;
    [itemsArray addObject:model1];
    
    ChatMessageModel *model2 = [ChatMessageModel new];
    model2.messageText = @"Hello World";
    model2.isIncomeMessage = NO;
    [itemsArray addObject:model2];
    
    ChatMessageModel *model3 = [ChatMessageModel new];
    model3.messageText =  @"Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello WorldHello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World";
    model3.isIncomeMessage = YES;
    [itemsArray addObject:model3];
    
    ChatMessageModel *model4 = [ChatMessageModel new];
    model4.messageText =  @"Hello World Hello World Hello World Hello World Hello World Hello World Hello World Hello World";
    model4.isIncomeMessage = NO;
    [itemsArray addObject:model4];
    
    ChatMessageModel *model5 = [ChatMessageModel new];
    model5.messageText = @"Hello World";
    model5.isIncomeMessage = YES;
    [itemsArray addObject:model5];
    
    self.chatTableView.delegate = self;
    self.chatTableView.dataSource = self;
}

- (IBAction)closeButtonClick:(NSClickGestureRecognizer *)sender {
    NSLog(@"Close click = %@", sender.className);
}

- (IBAction)sendMessageButtonClick:(NSClickGestureRecognizer *)sender {
    NSLog(@"Send click = %@", sender.className);
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [itemsArray count];
}

#pragma mark - TableViewDelegate

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    ChatMessageModel *model = [itemsArray objectAtIndex:row];
    if(model.isIncomeMessage) {
        ChatMsgInItem *cell = (ChatMsgInItem *)[tableView makeViewWithIdentifier:@"ChatMsgInItem" owner:self];
        cell.itemMessageLabel.stringValue = model.messageText;
        return cell;
    }else {
        ChatMsgOutItem *cell = (ChatMsgOutItem *)[tableView makeViewWithIdentifier:@"ChatMsgOutItem" owner:self];
        cell.itemMessageLabel.stringValue = model.messageText;
        return cell;
    }
}

//-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
//    return 100;
//}

-(void)drawDividerLine {
    NSBezierPath *path = [[NSBezierPath alloc] init];
    [path setLineWidth:1.0f];
    NSPoint point1 = CGPointMake(self.enterMessageBox.frame.origin.x, self.enterMessageBox.frame.size.height);
    NSPoint point2 = CGPointMake(self.enterMessageBox.frame.origin.x + self.enterMessageBox.frame.size.width, self.enterMessageBox.frame.size.height);
    NSColor *lineColor = [NSColor colorWithRed:255 green:255 blue:255 alpha:0.04f];
    [path moveToPoint:point1];
    [path lineToPoint:point2];
    [[NSColor redColor] set];
    [path stroke];
    [path closePath];
}

@end
