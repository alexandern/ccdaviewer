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


#import "HL7ClinicalDocumentSummary.h"
#import "HL7Enums_Private.h"
#import "HL7CodeSummary.h"

@implementation HL7ClinicalDocumentSummary
- (NSString *)confidentialityCodeAsString
{
    return [HL7Enumerations confidentialityAsAsString:self.confidentialityCode];
}

#pragma mark NSCopying
- (id)copyWithZone:(nullable NSZone *)zone
{
    HL7ClinicalDocumentSummary *clone = [[HL7ClinicalDocumentSummary allocWithZone:zone] init];
    [clone setTitle:[self title]];
    [clone setCode:[[self code] copyWithZone:zone]];
    [clone setEffectiveTime:[self effectiveTime]];
    [clone setConfidentialityCode:self.confidentialityCode];
    return clone;
}

#pragma mark NSCoding
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        [self setTitle:[decoder decodeObjectForKey:@"title"]];
        [self setCode:[decoder decodeObjectForKey:@"code"]];
        [self setEffectiveTime:[decoder decodeObjectForKey:@"effectiveTime"]];
        [self setConfidentialityCode:[decoder decodeIntegerForKey:@"confidentialityCode"]];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:[self title] forKey:@"title"];
    [encoder encodeObject:[self code] forKey:@"code"];
    [encoder encodeObject:[self effectiveTime] forKey:@"effectiveTime"];
    [encoder encodeInteger:[self confidentialityCode] forKey:@"confidentialityCode"];
}
@end
