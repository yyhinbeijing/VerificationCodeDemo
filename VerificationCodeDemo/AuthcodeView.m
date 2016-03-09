#import "AuthcodeView.h"

#define kRandomColor [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];  //随机颜色
#define kLineCount 6        //干扰线的个数
#define kLineWidth 2.0      //干扰线的宽度
#define kCharCount 5        //需要验证码的个数
#define kFontSize [UIFont systemFontOfSize:arc4random() % 5 + 15]   //字体大小
@interface AuthcodeView ()

@property (nonatomic, strong) NSArray *dataArray;           //字符素材数组
@property (nonatomic, strong) NSMutableString *authCodeStr; //验证码字符串

@end

@implementation AuthcodeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 5.0f;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        /*获取随机验证码*/
        [self getAuthcode];
    }
    return self;
}

#pragma mark - 获取随机验证码
- (void)getAuthcode {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AuthCode" ofType:@"plist"];
    
    _dataArray = [[NSArray alloc] initWithContentsOfFile:path];
    _authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    
    //No.1
    //开始写代码，随机从素材数组中取出需要个数的字符串，拼接为验证码字符串存入验证码数组中
    _dataArray = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"f",@"h",@"i",@"g",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t", nil];
    NSInteger m = _dataArray.count;
    NSMutableString *string1;
    NSMutableString *string2;
    string2 = [NSMutableString stringWithFormat:@"%@",@""];
    for (int i = 0; i <kCharCount ; i ++) {
        int t = arc4random()%m;
        string1 = _dataArray[t];
        string2 = [NSMutableString stringWithFormat:@"%@%@",string1,string2];
        
    }
    
    _authCodeStr = string2;
        
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self changeVerificationCode];
    [self.layer setNeedsDisplay];

}

#pragma mark - 点击界面切换验证吗
//No.2
//开始写代码，点击界面切换验证码
- (void)changeVerificationCode {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AuthCode" ofType:@"plist"];
    
    _dataArray = [[NSArray alloc] initWithContentsOfFile:path];
    _authCodeStr = [[NSMutableString alloc] initWithCapacity:kCharCount];
    
    //No.1
    //开始写代码，随机从素材数组中取出需要个数的字符串，拼接为验证码字符串存入验证码数组中
    _dataArray = [[NSArray alloc] initWithObjects:@"a",@"b",@"c",@"d",@"f",@"h",@"i",@"g",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t", nil];
    NSInteger m = _dataArray.count;
    NSMutableString *string1;
    NSMutableString *string2;
    string2 = [NSMutableString stringWithFormat:@"%@",@""];
    for (int i = 0; i <kCharCount ; i ++) {
        int t = arc4random()%m;
        string1 = _dataArray[t];
        string2 = [NSMutableString stringWithFormat:@"%@%@",string1,string2];
        
    }
    
    _authCodeStr = string2;
//    [self drawRect:self.frame];
    
}


//end_code

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.backgroundColor = [UIColor whiteColor];
    
    /*计算每个字符串显示的位置*/
    NSString *text = [NSString stringWithFormat:@"%@",_authCodeStr];
    
    CGSize cSize = [@"A" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    
    int width = rect.size.width / text.length - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    /*绘制字符*/
    float tempX,tempY;
    for (int i = 0 ; i < text.length; i ++) {
        tempX = arc4random() % width + rect.size.width / text.length * i;
        tempY = arc4random() % height;
        point = CGPointMake(tempX, tempY);
        
        unichar c = [text characterAtIndex:i];
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        
        [textC drawAtPoint:point withAttributes:@{NSFontAttributeName:kFontSize}];
    }
    
    //No.3
    //开始写代码，绘制kLineCount条随机色干扰线
    for (int i=0; i<kLineCount;i++) {
        CGContextRef context =  UIGraphicsGetCurrentContext();
        CGContextSetRGBStrokeColor(context, arc4random()%255/255.0,arc4random()%255/255.0, arc4random()%255/255.0,arc4random()%255/255.0);
        CGContextMoveToPoint(context, arc4random()%((int)self.frame.size.width),arc4random()%((int)self.frame.size.width));
        CGContextAddLineToPoint(context, arc4random()%((int)self.frame.size.width),arc4random()%((int)self.frame.size.width));
        CGContextStrokePath(context);
    }
}

@end
    //end_code
    
