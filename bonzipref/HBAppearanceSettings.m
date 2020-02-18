#import "BonziRootListController.h"

@implementation HBAppearanceBo

-(UIColor *)tintColor {
    return [UIColor blueColor];
}

-(UIColor *)statusBarTintColor {
    return [UIColor whiteColor];
}

-(UIColor *)navigationBarTitleColor {
    return [UIColor whiteColor];
}

-(UIColor *)navigationBarTintColor {
    return [UIColor whiteColor];
}

-(UIColor *)tableViewCellSeparatorColor {
    return [UIColor colorWithWhite:0 alpha:0];
}

-(UIColor *)navigationBarBackgroundColor {
    return [UIColor blueColor];
}

-(BOOL)translucentNavigationBar {
    return YES;
}

@end
