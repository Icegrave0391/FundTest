
#import "CameraController.h"

@interface CameraController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic, strong)UIImageView * imageView ;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation CameraController
-(UIImageView *)imageView{
    if(!_imageView){
        _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds] ;
    }
    return _imageView ;
}
- (UIImagePickerController *)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
    }
    return _imagePicker;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.imageView] ;
    self.imagePicker.delegate = self;
    
    self.navigationController.navigationBar.hidden = NO ;
    self.title = @"识别" ;
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"camera"] style:UIBarButtonItemStylePlain target:self action:@selector(openCamera)] ;
    self.navigationItem.rightBarButtonItem = right ;
}

#pragma mark - 拍照
-(void)openCamera{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"需要真机运行，才能打开相机哦" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    _imagePicker.allowsEditing = false;
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:_imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self facedetect];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)facedetect {
    
    NSDictionary *imageOptions =  [NSDictionary dictionaryWithObject:@(5) forKey:CIDetectorImageOrientation];
    CIImage *personciImage = [CIImage imageWithCGImage:_imageView.image.CGImage];
    NSDictionary *opts = [NSDictionary dictionaryWithObject:
                          CIDetectorAccuracyHigh forKey:CIDetectorAccuracy];
    CIDetector *faceDetector=[CIDetector detectorOfType:CIDetectorTypeFace context:nil options:opts];
    NSArray *features = [faceDetector featuresInImage:personciImage options:imageOptions];
    
    if (features.count > 0) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"您已通过识别" preferredStyle:UIAlertControllerStyleAlert];
//        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController dismissViewControllerAnimated:YES completion:nil] ;
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"未检测到人脸" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

@end
