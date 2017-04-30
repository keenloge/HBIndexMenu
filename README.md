# HBIndexMenu

HBIndexMenu 仿制自 ***汽车报价大全*** 的索引目录。

![汽车报价大全 V7.4 首页](http://upload-images.jianshu.io/upload_images/5476055-f04aad92e99a820f.PNG?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

并在其基础上增加了对长文本目录的支持：

![HBIndexMenu](http://upload-images.jianshu.io/upload_images/5476055-69c4d3dfc568fafa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

配色实在太丑了点，请见谅，毕竟谁拿来用都会配上自己需要的颜色的。

***

如果源代码和注释看不懂或者懒得看的，也可以听我多解释几句。

##布局：

![布局](http://upload-images.jianshu.io/upload_images/5476055-751f14b48902c7a3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)

从左往右依次代表我代码中所说的三种情况：
> 
1. 算上默认间隙，高度也足够，目录整体居中。
2. 默认间隙过大，适当的减小间隙，高度才足够。
3. 高度根本就不足，须重叠排列，**首尾紧贴边界**

## 间隙：
仔细看代码的同学可能会说，代码并没有严格按照布局图来布局。这点我承认。代码里面用了点投机取巧的办法，将间隙直接包含在标题的高度中初始化了，这样做不仅方便计算，而且更精确。真要像上面布局图布局的话，情况2中首尾标题有效点击范围会比其他标题略小，而超出边界的部分只能算作是有效滑动范围。

## 两个 *MaxOffsetX* 的关系：
![MaxOffsetX](http://upload-images.jianshu.io/upload_images/5476055-79112b92fe839eef.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/300)
标题在首次赋值文本时，会缩小到刚好放下首字符的大小，且保持中心点不变。因此后续缩放过程中，X的最大偏移量将加上首次缩小的这段X的值。这么做只是为了后续缩放统一，自然。

## 摔过的坑：
最开始想通过设置不同的UIFont来达到缩放的效果，其结果却是缩放效果虽然能达到，但是内存却消耗巨大，滑动时，内存消耗见增不见减的。猜测（还未去证实）是因为UIFont会缓存。这一点确实是之前没想到过的，切记切记。


其他地方应该还是比较容易理解了，有什么不足或谬误之处还请移步[简书](http://www.jianshu.com/p/5f94acf5edbe)指正。