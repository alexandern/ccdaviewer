/********************************************************************************
 * The MIT License (MIT)                                                        *
 *                                                                              *
 * Copyright (C) 2016 Alex Nolasco                                              *
 *                                                                              *
 *Permission is hereby granted, free of charge, to any person obtaining a copy  *
 *of this software and associated documentation files (the "Software"), to deal *
 *in the Software without restriction, including without limitation the rights  *
 *to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     *
 *copies of the Software, and to permit persons to whom the Software is         *
 *furnished to do so, subject to the following conditions:                      *
 *The above copyright notice and this permission notice shall be included in    *
 *all copies or substantial portions of the Software.                           *
 *                                                                              *
 *THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
 *IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      *
 *FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   *
 *AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        *
 *LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, *
 *OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     *
 *THE SOFTWARE.                                                                 *
 *********************************************************************************/

#import "ViewerResultsHeader.h"
#import "UIView+AutoLayout.h"

@interface ViewerResultsHeader ()
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@end


@implementation ViewerResultsHeader

- (void)fillWithDataSource:(id<SectionDataSourceProtocol>)dataSource section:(NSInteger)section
{
    self.bodyLabel.text = [dataSource titleForSection:section];

    self.subtitleLabel.text = [NSString stringWithFormat:NSLocalizedString(@"SummaryResults.Entries", nil), (long)[dataSource numberOfRowsInSection:section]];
    self.backgroundView = ({
        UIView *view = [[UIView alloc] initWithFrame:self.bounds];
        view.backgroundColor = [UIColor whiteColor];
        view;
    });
    //    [self addHorizontalLine];
}

//- (void) addHorizontalLine
//{
//    UIView *horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height,  self.frame.size.width, 5)];
//    horizontalLine.backgroundColor = [UIColor blackColor];
//    horizontalLine.translatesAutoresizingMaskIntoConstraints = NO;
//    [self addSubview:horizontalLine];
//
//    [horizontalLine pinEdges:JRTViewPinBottomEdge | JRTViewPinRightEdge | JRTViewPinLeftEdge toSameEdgesOfView:self];
//}
@end
