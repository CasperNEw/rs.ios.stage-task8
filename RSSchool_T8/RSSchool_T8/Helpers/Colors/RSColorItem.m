#import "RSColorItem.h"
@import UIKit;


@interface RSColorItem ()

@end


@implementation RSColorItem

+ (UIColor *)generateColor:(RSColorType)type
{
    switch (type) {
        case RSColorRed: return [self colorFromHexCode:@"E21B2C"];
        case RSColorDarkPurple: return [self colorFromHexCode:@"3E17CC"];
        case RSColorGreen: return [self colorFromHexCode:@"007C37"];
        case RSColorGrey: return [self colorFromHexCode:@"808080"];
        case RSColorPurple: return [self colorFromHexCode:@"9D5EEA"];
        case RSColorPeach: return [self colorFromHexCode:@"FF7A68"];
        case RSColorOrange: return [self colorFromHexCode:@"FFAD54"];
        case RSColorBlue: return [self colorFromHexCode:@"00AEED"];
        case RSColorPink: return [self colorFromHexCode:@"FF77A2"];
        case RSColorDarkBlue: return [self colorFromHexCode:@"002E3C"];
        case RSColorDarkGreen: return [self colorFromHexCode:@"0E3718"];
        case RSColorDarkRed: return [self colorFromHexCode:@"610F10"];

        case RSColorSeaGreen: return [self colorFromHexCode:@"21B08E"];
        case RSColorBlack: return [self colorFromHexCode:@"000000"];
        case RSColorSkyBlue: return [self colorFromHexCode:@"00B2FF"];
        case RSColorWhite: return [self colorFromHexCode:@"FFFFFF"];

        case RSColorBorder: return [self colorFromHexCode:@"00000015"];
    }
}

+ (UIColor *)colorFromHexCode:(NSString *)hexString
{
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                        [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                        [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                        [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }

    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];

    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


@end
