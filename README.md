# 5305-Project_Language-Recognition
This project is aimed to recognize language (English, Italian, Russian, and German).
Run the 'main' for checking.

# Dataset
The dataset is too large to upload to Github. Thus, only the using feature (MFCC) is uploaded.
So that, to run the code without error, some changes need to be applied:
![image](https://github.com/QinghongFrank/5305-Project_Language-Recognition/assets/141197302/fd02d352-bed2-49d0-8733-e08b46aaa264)
Please Comment the code on line 3&4

# Model
Gmm is used here and the trained one has already been uploaded and saved as 'GMM.mat', you can either use the pre-trained model directly or train again.

# Test
Similar with training set, the test set is too large to upload. Thus, only some samples are given in the test...
Then, you need to modify the 'test.mat' as shown below:
![image](https://github.com/QinghongFrank/5305-Project_Language-Recognition/assets/141197302/9b052967-8d59-40c8-afd4-f35a4168e0bc)
Change the line 20 to "for i = 1:1:12" and the label for test is [222111333444]
