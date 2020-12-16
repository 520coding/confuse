#import "TemplateFileView.h"

#import "Template.h"
#define view_space  (0 + 8 + 12 + 0)
#define view_width  (0 + 200 + 320 + 0)
#define view_height (0 + 60 + 400 + 0)
#define cell_length (0 + 40 + 50 + 0)
#define cell_count  (0 + 3 + 5 + 0)

@interface TemplateFileView ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *random_image;

@property (nonatomic, strong) UIButton *random_button;

@property (nonatomic, strong) UITextField *random_field;

@property (nonatomic, strong) NSMutableArray *random_array;

@end

@implementation TemplateFileView

@end
